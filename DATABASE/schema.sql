-- Create the genres table
CREATE TABLE IF NOT EXIST genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
)

-- Create the music_albums table
CREATE TABLE IF NOT EXIST music_albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    artist VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    on_spotify BOOLEAN NOT NULL,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres(id),
    published_date DATE NOT NULL,
    archived BOOLEAN NOT NULL
)

--- Create games table

CREATE TABLE games(
  id INT, 
  publish_date DATE, 
  multiplayer BOOLEAN, 
  last_played_at DATE, 
  author_id INT REFERENCES authors(id)
  PRIMARY KEY(id)
 );

 ---Create authors table

 CREATE TABLE authors(
  id INT,
  first_name VARCHAR
  last_name VARCHAR
  PRIMARY KEY(id)
 );