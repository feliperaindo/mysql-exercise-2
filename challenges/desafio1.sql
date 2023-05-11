-- RULES TO CHECK, CREATE AND USE DATABASE EXISTENCE
DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

-- RULES TO CREATE AND SET TABLES
CREATE TABLE artists (
    id INT AUTO_INCREMENT,
    artist_name VARCHAR(45) NOT NULL,
    CONSTRAINT PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE plans (
    id INT AUTO_INCREMENT,
    type_name VARCHAR(15) NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PRIMARY KEY (id)
)  ENGINE=INNODB;

CREATE TABLE albums (
    id INT AUTO_INCREMENT,
    album_name VARCHAR(25) NOT NULL,
    release_year INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (id)
)  ENGINE=INNODB;
 
CREATE TABLE musics (
    id INT AUTO_INCREMENT,
    song_name VARCHAR(45) NOT NULL,
    duration INT NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id),
    FOREIGN KEY (artist_id)
        REFERENCES artists (id),
    FOREIGN KEY (album_id)
        REFERENCES albums (id)
)  ENGINE=INNODB;
    
CREATE TABLE users_data (
    id INT AUTO_INCREMENT,
    user_name VARCHAR(45) NOT NULL,
    age INT NOT NULL,
    subscription_sign_in_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    subscription_plan_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (id),
    FOREIGN KEY (subscription_plan_id)
		  REFERENCES plans(id)
)  ENGINE=INNODB;
  
CREATE TABLE playback_history (
    reproduction_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    played_by INT NOT NULL,
    song_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (reproduction_date , played_by , song_id),
    FOREIGN KEY (played_by)
        REFERENCES users_data (id),
    FOREIGN KEY (song_id)
        REFERENCES musics (id)
)  ENGINE=INNODB;
  
CREATE TABLE follow (
    following_user_id INT NOT NULL,
    followed_artist_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (following_user_id , followed_artist_id),
    FOREIGN KEY (following_user_id)
        REFERENCES users_data (id),
    FOREIGN KEY (followed_artist_id)
        REFERENCES artists (id)
);

CREATE TABLE favorite_songs (
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id)
        REFERENCES users_data (id),
    FOREIGN KEY (song_id)
        REFERENCES musics (id)
);

-- INSERT VALUES IN EACH TABLE
INSERT INTO artists (artist_name)
	VALUES
		('Beyoncé'),
        ('Queen'),
        ('Elis Regina'),
        ('Baco Exu do Blues'),
        ('Blind Guardian'),
        ('Nina Simone');

INSERT INTO plans (type_name, cost)
	VALUES
		('gratuito', 0.00),
        ('familiar', 7.99),
        ('universitário', 5.99),
        ('pessoal', 6.99);

INSERT INTO albums (album_name, release_year, artist_id)
	VALUES
		('Renaissance', 2022, 1),
        ('Jazz', 1978, 2),
        ('Hot Space', 1982, 2),
        ('Falso Brilhante', 1998, 3),
        ('Vento de Maio', 2001, 3),
        ('QVVJFA?', 2003, 4),
        ('Somewhere Far Beyond', 2007, 5),
        ('I Put A Spell On You', 2012, 6);

INSERT INTO musics (song_name, duration, artist_id, album_id)
	VALUES
		("BREAK MY SOUL", 279, 1, 1),
        ("VIRGO'S GROOVE", 369, 1, 1),
        ("ALIEN SUPERSTAR", 116, 1, 1),
        ("Don't Stop Me Now", 203, 2, 2),
        ("Under Pressure", 152, 2, 3),
        ("Como Nossos Pais", 105, 3, 4),
        ("O Medo de Amar é o Medo de Ser Livre", 207, 3, 5),
        ("Samba em Paris", 267, 4, 6),
        ("The Bard's Song", 244, 5, 7),
        ("Feeling Good", 100, 6, 8);

INSERT INTO users_data (user_name, age, subscription_sign_in_date, subscription_plan_id)
	VALUES
		('Barbara Liskov', 82, '2019-10-20', 1),
		('Robert Cecil Martin', 58, '2017-01-06', 1),
		('Ada Lovelace', 37, '2017-12-30', 2),
		('Martin Fowler', 46, '2017-01-17', 2),
		('Sandi Metz', 58, '2018-04-29', 2),
		('Paulo Freire', 19, '2018-02-14', 3),
		('Bell Hooks', 26, '2018-01-05', 3),
		('Christopher Alexander', 85, '2019-06-05', 4),
		('Judith Butler', 45, '2020-05-13', 4),
		('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO playback_history (reproduction_date, played_by, song_id)
	VALUES
		("2022-02-28 10:45:55", 1, 8),
        ("2020-05-02 05:30:35", 1, 2),
        ("2020-03-06 11:22:33", 1, 10),
        ("2022-08-05 08:05:17", 2, 10),
        ("2020-01-02 07:40:33", 2, 7),
        ("2020-11-13 16:55:13", 3, 10),
        ("2020-12-05 18:38:30", 3, 2),
        ("2021-08-15 17:10:10", 4, 8),
        ("2022-01-09 01:44:33", 5, 8),
        ("2020-08-06 15:23:43", 5, 5),
        ("2017-01-24 00:31:17", 6, 7),
        ("2017-10-12 12:35:20", 6, 1),
        ("2011-12-15 22:30:49", 7, 4),
        ("2012-03-17 14:56:41", 8, 4),
        ("2022-02-24 21:14:22", 9, 9),
        ("2015-12-13 08:30:22", 10, 3);

INSERT INTO follow (following_user_id, followed_artist_id)
	VALUES
		(1, 1),
        (1, 2),
        (1, 3),
        (2, 1),
        (2, 3),
        (3, 2),
        (4, 4),
        (5, 5),
        (5, 6),
        (6, 6),
        (6, 1),
        (7, 6),
        (9, 3),
        (10, 2);

INSERT INTO favorite_songs (user_id, song_id)
    VALUES
        (1, 3),
        (1, 6),
        (1, 10),
        (2, 4),
        (3, 1),
        (3, 3),
        (4, 7),
        (4, 4),
        (5, 10),
        (5, 2),
        (8, 4),
        (9, 7),
        (10, 3);