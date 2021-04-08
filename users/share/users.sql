-- $ sqlite3 users.db < users.sql

PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INTEGER primary key,
    username VARCHAR,
    email VARCHAR,
    password VARCHAR,
    UNIQUE(username),
    UNIQUE(email)
);

DROP TABLE IF EXISTS following;
CREATE TABLE following (
    follows INTEGER,
    follower INTEGER,
    FOREIGN KEY (follows) REFERENCES users(id),
    FOREIGN KEY (follower) REFERENCES users(id),
    PRIMARY KEY (follows, follower)
);


insert into users (username, email, password) values ('cfreen0', 'mmichelle0@nasa.gov', '8ISLANqWK');
insert into users (username, email, password) values ('jmansford1', 'rdowsing1@hhs.gov', 'CRpH7Z0SZ48');
insert into users (username, email, password) values ('triden2', 'twilstead2@squarespace.com', 'pxFdm1abysO');
insert into users (username, email, password) values ('gtredwell3', 'dboyson3@geocities.jp', 'tEyTU3Ds');
insert into users (username, email, password) values ('cfidal4', 'ehallworth4@prweb.com', 'sreei4kgmll');
insert into users (username, email, password) values ('bfoxwell5', 'tcommin5@ask.com', '6qmAnT');
insert into users (username, email, password) values ('hbuckland6', 'efealey6@who.int', 'fC7gBE');
insert into users (username, email, password) values ('claxtonne7', 'yvondra7@dailymail.co.uk', 'nWpVyXdG6e');
insert into users (username, email, password) values ('fgillson8', 'oniezen8@ocn.ne.jp', 'pHWMzycP');
insert into users (username, email, password) values ('pbartelet9', 'peglese9@irs.gov', 'GrbwlvA7L');


insert into following (follows,follower) values (1,3);
insert into following (follows,follower) values (1,2);
insert into following (follows,follower) values (1,7);
insert into following (follows,follower) values (1,9);

insert into following (follows,follower) values (1,5);
insert into following (follows,follower) values (1,8);

insert into following (follows,follower) values (2,10);
insert into following (follows,follower) values (2,3);

insert into following (follows,follower) values (3,5);
insert into following (follows,follower) values (3,2);
insert into following (follows,follower) values (3,7);

insert into following (follows,follower) values (4,5);

insert into following (follows,follower) values (5,1);
insert into following (follows,follower) values (5,8);

insert into following (follows,follower) values (6,9);
insert into following (follows,follower) values (6,7);
insert into following (follows,follower) values (6,5);
insert into following (follows,follower) values (6,4);
insert into following (follows,follower) values (6,2);
insert into following (follows,follower) values (6,3);
insert into following (follows,follower) values (6,10);

insert into following (follows,follower) values (7,8);

insert into following (follows,follower) values (8,5);
insert into following (follows,follower) values (8,7);

insert into following (follows,follower) values (9,2);
insert into following (follows,follower) values (9,4);
insert into following (follows,follower) values (9,6);

insert into following (follows,follower) values (10,1);
insert into following (follows,follower) values (10,6);


COMMIT;
