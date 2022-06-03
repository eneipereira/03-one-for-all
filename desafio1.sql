drop database if exists SpotifyClone;
create database if not exists SpotifyClone;

create table if not exists SpotifyClone.plan (
	id int not null auto_increment,
  type varchar(50) not null,
  price double not null,
  primary key (id)
) engine = InnoDB;

create table if not exists SpotifyClone.artist (
	id int not null auto_increment,
  artist_name varchar(100) not null,
  primary key (id)
) engine = InnoDB;

create table if not exists SpotifyClone.user (
	id int not null auto_increment,
  username varchar(100) not null,
  age int not null,
  hired_at datetime default now(),
  plan_id int not null,
  primary key (id),
  foreign key (plan_id) references SpotifyClone.plan (id)
) engine = InnoDB;

create table if not exists SpotifyClone.album (
	id int not null auto_increment,
  album_name varchar(100) not null,
  artist_id int not null,
  release_year int not null,
  primary key (id),
  foreign key (artist_id) references SpotifyClone.artist (id)
) engine = InnoDB;

create table if not exists SpotifyClone.song (
	id int not null auto_increment,
  song_name varchar(100) not null,
  album_id int not null,
  length int not null,
  primary key (id),
  foreign key (album_id) references SpotifyClone.album (id)
) engine = InnoDB;

create table if not exists SpotifyClone.following_artists (
	user_id int not null,
  artist_id int not null,
  primary key (user_id, artist_id),
  foreign key (user_id) references SpotifyClone.user (id),
  foreign key (artist_id) references SpotifyClone.artist (id)
) engine = InnoDB;

create table if not exists SpotifyClone.streaming_history (
	user_id int not null,
	played_at datetime default now(),
	song_id int not null,
  artist_id int not null,
  primary key (user_id, song_id),
  foreign key (user_id) references SpotifyClone.user (id),
  foreign key (song_id) references SpotifyClone.song (id),
  foreign key (artist_id) references SpotifyClone.artist (id)    
) engine = InnoDB;

insert into SpotifyClone.plan (type, price)
values ('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

insert into SpotifyClone.artist (artist_name)
values ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon'),
('Tyler Isle'),
('Fog');

insert into SpotifyClone.user (username, age, hired_at, plan_id)
values ('Thati', 23, '2019-10-20 00:00:00', 1),
('Cintia', 35, '2017-12-30 00:00:00', 2),
('Bill', 20, '2019-06-05 00:00:00', 3),
('Roger', 45, '2020-05-13 00:00:00', 4),
('Norman', 58, '2017-02-17 00:00:00', 4),
('Patrick', 33, '2017-01-06 00:00:00', 2),
('Vivian', 26, '2018-01-05 00:00:00', 3),
('Carol', 19, '2018-02-14 00:00:00', 3),
('Angelina', 42, '2018-04-29 00:00:00', 2),
('Paul', 46, '2017-01-17 00:00:00', 2);

insert into SpotifyClone.album (album_name, artist_id, release_year)
values ('Envious', 1, 1990),
('Exuberant', 1, 1993),
('Hallowed Steam', 2, 1995),
('Incandescent', 3, 1998),
('Temporary Culture', 4, 2001),
('Library of liberty', 4, 2003),
('Chained Down', 5, 2007),
('Cabinet of fools', 5, 2012),
('No guarantees', 5, 2015),
('Apparatus', 6, 2015);

insert into SpotifyClone.song (song_name, album_id, length)
values ('Soul For Us', 1, 200),
('Reflections Of Magic', 1, 163),
('Dance With Her Own', 1, 116),
('Troubles Of My Inner Fire', 2, 203),
('Time Fireworks', 2, 152),
('Magic Circus', 3, 105),
('Honey, So Do I', 3, 207),
("Sweetie, Let's Go Wild", 3, 139),
('She Knows', 3, 244),
('Fantasy For Me', 4, 100),
('Celebration of More', 4, 146),
('Rock His Everything', 4, 223),
('Home Forever', 4, 231),
('Diamond Power', 4, 241),
("Let's Be Silly", 4, 132),
('Thang Of Thunder', 5, 240),
('Words Of Her Life', 5, 185),
('Without My Streets', 5, 176),
('Need Of THe Evening', 6, 190),
('History Of My Roses', 6, 222),
('Without My Love', 6, 111),
('Walking And Game', 6, 123),
('Young And Father', 6, 197),
('Finding My Traditions', 7, 179),
('Walking And Man', 7, 229),
('Hard And Time', 7, 135),
("Honey, I'm A Lone Wolf", 7, 150),
("She Thinks I Won't Stay Tonight", 8, 166),
("He Heard You're Bad For Me", 8, 154),
("He Hopes We Can't Stay", 8, 210),
('I Know I Know', 8, 117),
("He's Walking Away", 9, 159),
("He's Trouble", 9, 138),
('I Heard I Want To Be Alone', 9, 120),
('I Ride Alone', 9, 151),
('Honey', 10, 79),
('You Cheated On Me', 10, 95),
("Wouldn't It Be Nice", 10, 213),
('Baby', 10, 136),
('You Make Me Feel So..', 10, 83);

insert into SpotifyClone.following_artists (user_id, artist_id)
values (1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 3),
(6, 1),
(7, 2),
(7, 5),
(8, 1),
(8, 5),
(9, 6),
(9, 4),
(9, 3),
(10, 2),
(10, 6);

insert into SpotifyClone.streaming_history (user_id, played_at, song_id, artist_id)
values (1, '2020-02-28 10:45:55', 36, 6),
(1, '2020-05-02 05:30:35', 25, 5),
(1, '2020-03-06 11:22:33', 23, 4),
(1, '2020-08-05 08:05:17', 14, 3),
(1, '2020-09-14 16:32:22', 15, 3),
(2, '2020-01-02 07:40:33', 34, 5),
(2, '2020-05-16 06:16:22', 24, 5),
(2, '2020-10-09 12:27:48', 21, 4),
(2, '2020-09-21 13:14:46', 39, 6),
(3, '2020-11-13 16:55:13', 6, 2),
(3, '2020-12-05 18:38:30', 3, 1),
(3, '2020-07-30 10:00:00', 26, 5),
(4, '2021-08-15 17:10:10', 2, 1),
(4, '2021-07-10 15:20:30', 35, 5),
(4, '2021-01-09 01:44:33', 27, 5),
(5, '2020-07-03 19:33:28', 7, 2),
(5, '2017-02-24 21:14:22', 12, 3),
(5, '2020-08-06 15:23:43', 14, 3),
(5, '2020-11-10 13:52:27', 1, 1),
(6, '2019-02-07 20:33:48', 38, 6),
(6, '2017-01-24 00:31:17', 29, 5),
(6, '2017-10-12 12:35:20', 30, 5),
(6, '2018-05-29 14:56:41', 22, 4),
(7, '2018-05-09 22:30:49', 5, 1),
(7, '2020-07-27 12:52:58', 4, 1),
(7, '2018-01-16 18:40:43', 11, 3),
(8, '2018-03-21 16:56:40', 39, 6),
(8, '2020-10-18 13:38:05', 40, 6),
(8, '2019-05-25 08:14:03', 32, 5),
(8, '2021-08-15 21:37:09', 33, 5),
(9, '2021-05-24 17:23:45', 16, 4),
(9, '2018-12-07 22:48:52', 17, 4),
(9, '2021-03-14 06:14:26', 8, 2),
(9, '2020-04-01 03:36:00', 9, 2),
(10, '2017-02-06 08:21:34', 20, 4),
(10, '2017-12-04 05:33:43', 21, 4),
(10, '2017-07-27 05:24:49', 12, 3),
(10, '2017-12-25 01:03:57', 13, 3);