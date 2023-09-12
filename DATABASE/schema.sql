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