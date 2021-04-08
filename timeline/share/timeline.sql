-- $ sqlite3 users.db < users.sql

PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    username VARCHAR,
    text TEXT,
    timestamp DATETIME
);

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



insert into posts (username, text, timestamp) values ('cfreen0', 'Nulla tellus. In sagittis dui vel nisl.', '2021-01-14 08:55:18');
insert into posts (username, text, timestamp) values ('cfreen0', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.', '2021-01-30 00:23:37');
insert into posts (username, text, timestamp) values ('cfreen0', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', '2021-01-16 11:51:28');
insert into posts (username, text, timestamp) values ('cfreen0', 'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2021-02-20 21:48:38');
insert into posts (username, text, timestamp) values ('cfreen0', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.', '2021-01-31 02:11:55');
insert into posts (username, text, timestamp) values ('jmansford1', 'Duis at velit eu est congue elementum. In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante.', '2021-01-25 09:28:11');
insert into posts (username, text, timestamp) values ('jmansford1', 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.', '2021-01-03 10:23:56');
insert into posts (username, text, timestamp) values ('triden2', 'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', '2021-01-16 08:23:01');
insert into posts (username, text, timestamp) values ('triden2', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', '2021-02-26 18:53:00');
insert into posts (username, text, timestamp) values ('triden2', 'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.', '2021-02-02 12:42:08');
insert into posts (username, text, timestamp) values ('triden2', 'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', '2021-01-06 12:45:45');
insert into posts (username, text, timestamp) values ('triden2', 'Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', '2021-02-24 19:44:18');
insert into posts (username, text, timestamp) values ('triden2', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.', '2021-02-02 05:29:30');
insert into posts (username, text, timestamp) values ('triden2', 'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', '2021-01-28 01:22:31');
insert into posts (username, text, timestamp) values ('triden2', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.', '2021-02-03 11:07:15');
insert into posts (username, text, timestamp) values ('gtredwell3', 'Quisque ut erat. Curabitur gravida nisi at nibh. In hac habitasse platea dictumst.', '2021-01-03 18:44:26');
insert into posts (username, text, timestamp) values ('gtredwell3', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', '2021-01-30 20:14:44');
insert into posts (username, text, timestamp) values ('gtredwell3', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', '2021-02-11 16:18:14');
insert into posts (username, text, timestamp) values ('cfidal4', 'In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', '2021-01-01 17:30:05');
insert into posts (username, text, timestamp) values ('bfoxwell5', 'Pellentesque ultrices mattis odio. Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.', '2021-02-19 07:51:53');
insert into posts (username, text, timestamp) values ('bfoxwell5', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.', '2021-02-04 15:15:56');
insert into posts (username, text, timestamp) values ('bfoxwell5', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', '2021-02-16 13:22:39');
insert into posts (username, text, timestamp) values ('bfoxwell5', 'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', '2021-01-07 00:48:43');
insert into posts (username, text, timestamp) values ('bfoxwell5', 'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus. Phasellus in felis. Donec semper sapien a libero.', '2021-02-01 20:10:56');
insert into posts (username, text, timestamp) values ('hbuckland6', 'In congue. Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy.', '2021-02-18 13:51:49');
insert into posts (username, text, timestamp) values ('hbuckland6', 'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '2021-01-21 18:34:27');
insert into posts (username, text, timestamp) values ('hbuckland6', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.', '2021-01-30 01:30:27');
insert into posts (username, text, timestamp) values ('claxtonne7', 'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam.', '2021-01-05 07:25:01');
insert into posts (username, text, timestamp) values ('claxtonne7', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.', '2021-01-17 21:22:02');
insert into posts (username, text, timestamp) values ('claxtonne7', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.', '2021-01-16 16:10:49');
insert into posts (username, text, timestamp) values ('claxtonne7', 'In hac habitasse platea dictumst.', '2021-02-27 01:10:41');
insert into posts (username, text, timestamp) values ('claxtonne7', 'Cras non velit nec nisi vulputate nonummy.', '2021-01-25 16:28:51');
insert into posts (username, text, timestamp) values ('claxtonne7', 'Aenean fermentum.', '2021-02-14 16:29:33');
insert into posts (username, text, timestamp) values ('claxtonne7', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', '2021-01-26 07:58:16');
insert into posts (username, text, timestamp) values ('claxtonne7', 'Ut tellus. Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', '2021-01-28 01:11:00');
insert into posts (username, text, timestamp) values ('fgillson8', 'Pellentesque ultrices mattis odio. Donec vitae nisi.', '2021-02-12 04:48:47');
insert into posts (username, text, timestamp) values ('pbartelet9', 'Mauris sit amet eros.', '2021-01-09 06:47:14');
insert into posts (username, text, timestamp) values ('pbartelet9', 'Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', '2021-01-08 06:50:45');
insert into posts (username, text, timestamp) values ('pbartelet9', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.', '2021-02-07 00:58:06');
insert into posts (username, text, timestamp) values ('pbartelet9', 'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', '2021-02-22 12:10:32');



COMMIT;
