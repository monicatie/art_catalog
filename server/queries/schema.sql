CREATE TABLE sightings (
    sighting_id INTEGER PRIMARY KEY AUTOINCREMENT,
    sighting_date TEXT,
    url TEXT,
    user_name TEXT NOT NULL,
    museum_name TEXT,
    title TEXT,
    artist TEXT,
    date_created TEXT,
    file_type TEXT NOT NULL DEFAULT "image"
);