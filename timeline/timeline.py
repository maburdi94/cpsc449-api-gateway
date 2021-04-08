import sys
import textwrap
import logging.config
import sqlite3

import bottle
from bottle import get, post, route, error, abort, request, response, template, HTTPResponse
from bottle.ext import sqlite


# Set up app, plugins, and logging
#
app = bottle.default_app()
app.config.load_config('./etc/api.ini')

plugin = sqlite.Plugin(app.config['sqlite.dbfile'])
app.install(plugin)

logging.config.fileConfig(app.config['logging.config'])


# Return errors in JSON
#
# Adapted from # <https://stackoverflow.com/a/39818780>
#
def json_error_handler(res):
    if res.content_type == 'application/json':
        return res.body
    res.content_type = 'application/json'
    if res.body == 'Unknown Error.':
        res.body = bottle.HTTP_CODES[res.status_code]
    return bottle.json_dumps({'error': res.body})


app.default_error_handler = json_error_handler


# Disable warnings produced by Bottle 0.12.19.
#
#  1. Deprecation warnings for bottle_sqlite
#  2. Resource warnings when reloader=True
#
# See
#  <https://docs.python.org/3/library/warnings.html#overriding-the-default-filter>
#
if not sys.warnoptions:
    import warnings
    for warning in [DeprecationWarning, ResourceWarning]:
        warnings.simplefilter('ignore', warning)


# Simplify DB access
#
# Adapted from
# <https://flask.palletsprojects.com/en/1.1.x/patterns/sqlite3/#easy-querying>
#
def query(db, sql, args=(), one=False):
    cur = db.execute(sql, args)
    rv = [dict((cur.description[idx][0], value)
          for idx, value in enumerate(row))
          for row in cur.fetchall()]
    cur.close()

    return (rv[0] if rv else None) if one else rv


def execute(db, sql, args=()):
    cur = db.execute(sql, args)
    id = cur.lastrowid
    cur.close()

    return id



# Routes

@get('/posts')
def getPosts(db):
    q = request.query

    user = q.get('user')
    # all = q.get('all')

    page = int(q['page']) if q.get('page') else 0

    sql  = 'SELECT * FROM posts'
    sql += ' WHERE username = ?' if user else ''
    sql += ' ORDER BY timestamp DESC'
    sql += ' LIMIT 25 OFFSET 25 * ?'

    args = (user,) if user else ()
    args += (page,)

    posts = query(db, sql, args)

    return {'posts': posts}


@get('/<username>')
def getUserHomeTimeline(username, db):

    q = request.query

    page = int(q['page']) if q.get('page') else 0

    sql = '''
    SELECT * from posts
    WHERE username IN (
        SELECT username from users WHERE id IN (
            SELECT follows FROM following WHERE follower = (SELECT id FROM users WHERE username = ?)
        )
    )
    LIMIT 25 OFFSET 25 * ?'''

    posts = query(db, sql, (username,page))

    return {'posts': posts}



@route('/posts', method='POST')
def postTweet(db):
    data = request.json

    username = data.get('username')
    text = data.get('text')

    sql = 'INSERT INTO posts (username, text, timestamp) VALUES (?,?,datetime(\'now\'))'

    execute(db, sql, (username, text))
