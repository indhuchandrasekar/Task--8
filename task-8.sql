-- Create database
CREATE DATABASE IF NOT EXISTS imdb;
USE imdb;

-- Table: Media

CREATE TABLE IF NOT EXISTS Media (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    media_type ENUM('Video', 'Image') NOT NULL,
    media_url VARCHAR(255) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE
);
INSERT VALUES INTO MEDIA(media_id,media_type)
VALUES(1111.video),
(1122,video),
(1123, Photo);
SHOW DATABASES;
SHOW TABLES;

SELECT *from MEDIA;
-- Table: Genre
CREATE TABLE IF NOT EXISTS Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL,
    UNIQUE(genre_name)
);

-- Table: Movie_Genre (Many-to-Many relationship)

INSERT INTO Genre (genre_id , genre_name)
values(1, romance),
(2, comedy),
(3, thriller);
CREATE TABLE Movie_Genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id) ON DELETE CASCADE
);
INSERT INTO movie_genre(movie_id, genre_id)
VALUES
(101, 1),
(102,2),
(103,3);
SHOW DATABASES;
SHOW TABLES;

SELECT *from Movie_Genre;

CREATE TABLE IF NOT EXISTS Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    
    review_text TEXT,
    rating DECIMAL(3, 1),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id) ON DELETE CASCADE
    -- Assuming user_id references a user table which is not defined here
    -- FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
    );
INSERT INTO Review (review_id,movie_id,review_text,rating)
VALUES
(1011,101,"Good",5),
(1022,102,"better",4),
(1022,103,"not good",2.5);
SELECT *from Review;
SHOW DATABASES;
SHOW TABLES;

CREATE TABLE IF NOT EXISTS Artist (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(255) NOT NULL,
    -- Other attributes as needed
    UNIQUE(artist_name)
);
INSERT INTO Artist(artist_id, artist_name)
VALUES(111, jimin),
(112, jk),
(113, jhope);
-- Table: Artist_Skill (Many-to-Many relationship)
CREATE TABLE IF NOT EXISTS Artist_Skill (
    artist_id INT,
    skill VARCHAR(50) NOT NULL,
    PRIMARY KEY (artist_id, skill),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id) ON DELETE CASCADE
);
INSERT INTO Artist_Skill(artist_id, skill)
VALUES(111,SINGING),
(112, DANCING),
(113, MIMICRY);

SELECT *from Artist_Skill;
-- Table: Artist_Role
SHOW DATABASES;
SHOW TABLES;


CREATE TABLE IF NOT EXISTS Artist_Role (
    artist_id INT,
    movie_id INT,
    role_name VARCHAR(100) NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id) ON DELETE CASCADE
    );
INSERT INTO Artist_Role (artist_id, movie_id, role_name)
VALUES(111,101, dad),
(112,102,hero),
(113,103,villan),
(111,101,son);
select *from Artist_Role;