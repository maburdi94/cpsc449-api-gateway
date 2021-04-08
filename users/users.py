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

@post('/users')
def createUser(db):
    data = request.json

    username = data.get('username')
    email = data.get('email')
    password = data.get('password')

    if username is None or email is None or password is None:
        abort(400, "Bad request")
        return 'false'
    else:

        sql = 'INSERT INTO users (username,email,password) VALUES (?,?,?)'
        execute(db, sql, (username,email,password))

        return 'true'


@route('/users/<username>/verify', method='POST')
def checkPassword(username, db):
    data = request.json

    password = data.get('password')

    if password is None:
        abort(400, "Bad request")

    sql = 'SELECT password FROM users WHERE username = ?'
    user = query(db, sql, (username,), one=True)

    return 'true' if (user and user['password'] == password) else 'false'



@route('/users/<usernameToFollow>/follow/<username>', method='POST')
def addFollower(username, usernameToFollow, db):

    sql = '''INSERT INTO following (follows, follower)
                VALUES ((SELECT id FROM users WHERE username = ?),
                (SELECT id FROM users WHERE username = ?))'''

    id = execute(db, sql, (usernameToFollow, username))



@route('/users/<usernameToUnfollow>/follow/<username>', method='DELETE')
def removeFollower(username, usernameToUnfollow, db):

    sql = '''DELETE FROM following
                WHERE follows = (SELECT id FROM users WHERE username = ?)
                AND follower = (SELECT id FROM users WHERE username = ?)'''

    execute(db, sql, (usernameToUnfollow, username))



@get('/users')
def getUsers(db):

    user = request.query.user or None

    sql = 'SELECT * from users'
    bind = ()

    if user:
        sql += ' WHERE username = ?'
        bind += (user,)

    users = query(db, sql, bind)

    for user in users:
        id = user['id']
        sql = '''
        SELECT id,username from users WHERE id IN (
            SELECT follows FROM following WHERE follower = ?
        )'''
        user['following'] = query(db, sql, (id,))


    print(users[0])


    return users[0] if user else {'users': users}
