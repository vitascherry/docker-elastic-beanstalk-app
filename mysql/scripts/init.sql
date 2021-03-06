CREATE DATABASE IF NOT EXISTS filmsdb /*!40100 DEFAULT CHARACTER SET utf8 */;

USE filmsdb;

CREATE TABLE IF NOT EXISTS actor (
  id varchar(50) NOT NULL,
  name varchar(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into actor (id, name) values
('1', 'Tyrion Lannister'),
('2', 'Jon Snow'),
('3', 'Jaime Lannister'),
('4', 'Petyr Baelish'),
('5', 'Jorah Mormont'),
('6', 'Theon Greyjoy'),
('7', 'Bran Stark'),
('8', 'Sandor Clegane'),
('9', 'Joffrey Baratheon'),
('10', 'Robb Stark'),
('11', 'Khal Drogo'),
('12', 'Ned Stark'),
('13', 'Robert Baratheon'),
('14', 'Samwell arly'),
('15', 'Tywin Lannister');


CREATE TABLE IF NOT EXISTS film (
  id varchar(50) NOT NULL,
  name varchar(100) NOT NULL,
  year int(11) NOT NULL,
  director varchar(100) NOT NULL,
  rating int(11) NOT NULL,
  description varchar(500) NOT NULL,
  trailer varchar(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into film (id, name, year, director, rating, description, trailer) values
('1',  'The Shawshank Redemption',                1990, 'test', 3, 'Wrongly convicted, Andy Dufresne is sentenced to two consecutive life terms in in Maine\'s Shawshank prison for the murders of his wife and her lover. Set in the 1940\'s, the film shows how Andy learns to get by in the brutal confines of prison, even earning the respect of his fellow inmates, most notably the longtime convict "Red" Redding.', 'https://www.youtube.com/embed/6hB3S9bIaco'),
('2',  'The Godfather',                          1991, 'test', 4, 'Test', 'Test'),
('3',  'The Dark Knight',                        1992, 'test', 2, 'Test', 'Test'),
('4',  '12 Angry Men',                           1993, 'test', 3, 'Test', 'Test'),
('5',  'Schindler\'s List',                       1994, 'test', 1, 'Test', 'Test'),
('6',  'Pulp Fiction',                           1995, 'test', 3, 'Test', 'Test'),
('7',  'The Lord of the Rings',                   1996, 'test', 5, 'Test', 'Test'),
('8',  'The Good, the Bad and the Ugly',           1997, 'test', 3, 'Test', 'Test'),
('9',  'Fight Club',                             1998, 'test', 1, 'Test', 'Test'),
('10', 'Forrest Gump',                           1999, 'test', 3, 'Test', 'Test');


CREATE TABLE IF NOT EXISTS genre (
  id varchar(50) NOT NULL,
  name varchar(45) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO genre (id, name) VALUES
('1', 'Action'),
('2', 'Adventure'),
('3', 'Comedy'),
('4', 'Criminal'),
('5', 'Drama'),
('6', 'Historical'),
('7', 'Horror'),
('8', 'Musicals'),
('9', 'Sience Fiction'),
('10', 'War'),
('11', 'Westerns'),
('12', 'Biopics'),
('13', 'Detective'),
('14', 'Fantasy'),
('15', 'Melodramas'),
('16', 'Superhero'),
('17', 'Thriller'),
('18', 'Serials');


CREATE TABLE IF NOT EXISTS comment (
  id varchar(50) NOT NULL,
  id_film varchar(50) NOT NULL,
  posted datetime NOT NULL,
  author varchar(45) NOT NULL,
  text varchar(500) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id),
  KEY film_id_fk_idx (id_film),
  KEY latest_posted_date (posted),
  CONSTRAINT comment_id_film_fk FOREIGN KEY (id_film) REFERENCES film (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS film_genre (
  id_film varchar(50) NOT NULL,
  id_genre varchar(50) NOT NULL,
  PRIMARY KEY (id_film,id_genre),
  KEY film_genre_id_genre_fk_idx (id_genre),
  CONSTRAINT film_genre_id_film_fk FOREIGN KEY (id_film) REFERENCES film (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT film_genre_id_genre_fk FOREIGN KEY (id_genre) REFERENCES genre (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO film_genre (id_film, id_genre) VALUES
('1', '5'),
('1', '4'),
('2', '5'),
('2', '4'),
('3', '4'),
('3', '14'),
('3', '17'),
('4', '5'),
('5', '12'),
('5', '6'),
('5', '10'),
('5', '5'),
('6', '3'),
('6', '4'),
('6', '17'),
('7', '14'),
('7', '2'),
('8', '11'),
('8', '2'),
('9', '4'),
('9', '5'),
('9', '17'),
('10', '5'),
('10', '15');


CREATE TABLE IF NOT EXISTS cast (
  id_film varchar(50) NOT NULL,
  id_actor varchar(50) NOT NULL,
  PRIMARY KEY (id_film,id_actor),
  KEY actor_id_fk (id_actor),
  CONSTRAINT actor_id_fk FOREIGN KEY (id_actor) REFERENCES actor (id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT film_id_fk FOREIGN KEY (id_film) REFERENCES film (id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into cast (id_film, id_actor) values
('1',  '1'),
('1',  '2'),
('1',  '3'),
('1',  '4'),
('1',  '5'),
('1',  '6'),
('1',  '7'),
('1',  '8'),
('1',  '9'),
('1',  '10'),
('1',  '11'),
('1',  '12'),
('1',  '13'),
('1',  '14'),
('1',  '15'),
('2',  '1'),
('2',  '2'),
('2',  '3'),
('2',  '4'),
('2',  '5'),
('2',  '6'),
('2',  '7'),
('2',  '8'),
('2',  '9'),
('2',  '10'),
('2',  '11'),
('2',  '12'),
('2',  '13'),
('2',  '14'),
('2',  '15'),
('3',  '1'),
('3',  '2'),
('3',  '3'),
('3',  '4'),
('3',  '5'),
('3',  '6'),
('3',  '7'),
('3',  '8'),
('3',  '9'),
('3',  '10'),
('3',  '11'),
('3',  '12'),
('3',  '13'),
('3',  '14'),
('3',  '15'),
('4',  '1'),
('4',  '2'),
('4',  '3'),
('4',  '4'),
('4',  '5'),
('4',  '6'),
('4',  '7'),
('4',  '8'),
('4',  '9'),
('4',  '10'),
('4',  '11'),
('4',  '12'),
('4',  '13'),
('4',  '14'),
('4',  '15'),
('5',  '1'),
('5',  '2'),
('5',  '3'),
('5',  '4'),
('5',  '5'),
('5',  '6'),
('5',  '7'),
('5',  '8'),
('5',  '9'),
('5',  '10'),
('5',  '11'),
('5',  '12'),
('5',  '13'),
('5',  '14'),
('5',  '15'),
('6',  '1'),
('6',  '2'),
('6',  '3'),
('6',  '4'),
('6',  '5'),
('6',  '6'),
('6',  '7'),
('6',  '8'),
('6',  '9'),
('6',  '10'),
('6',  '11'),
('6',  '12'),
('6',  '13'),
('6',  '14'),
('6',  '15'),
('7',  '1'),
('7',  '2'),
('7',  '3'),
('7',  '4'),
('7',  '5'),
('7',  '6'),
('7',  '7'),
('7',  '8'),
('7',  '9'),
('7',  '10'),
('7',  '11'),
('7',  '12'),
('7',  '13'),
('7',  '14'),
('7',  '15'),
('8',  '1'),
('8',  '2'),
('8',  '3'),
('8',  '4'),
('8',  '5'),
('8',  '6'),
('8',  '7'),
('8',  '8'),
('8',  '9'),
('8',  '10'),
('8',  '11'),
('8',  '12'),
('8',  '13'),
('8',  '14'),
('8',  '15'),
('9',  '1'),
('9',  '2'),
('9',  '3'),
('9',  '4'),
('9',  '5'),
('9',  '6'),
('9',  '7'),
('9',  '8'),
('9',  '9'),
('9',  '10'),
('9',  '11'),
('9',  '12'),
('9',  '13'),
('9',  '14'),
('9',  '15'),
('10',  '1'),
('10',  '2'),
('10',  '3'),
('10',  '4'),
('10',  '5'),
('10',  '6'),
('10',  '7'),
('10',  '8'),
('10',  '9'),
('10', '10'),
('10', '11'),
('10', '12'),
('10', '13'),
('10', '14'),
('10', '15');

ALTER USER 'root'@'localhost' IDENTIFIED BY 'newpassword';

CREATE USER 'test'@'localhost' IDENTIFIED BY 'password';

GRANT SELECT, UPDATE, INSERT, DELETE ON *.* TO 'test'@'localhost' WITH GRANT OPTION;

CREATE USER 'test'@'%' IDENTIFIED BY 'password';

GRANT SELECT, UPDATE, INSERT, DELETE ON *.* TO 'test'@'%' WITH GRANT OPTION;