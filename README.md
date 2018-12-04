# art_catalogue

A flask app for cataloging artwork seen in travels

====
To start
export FLASK_APP=server
export FLASK_ENV=development
flask run

====
To start the DB
The db doesn't update itself. To update it run
flask init-db
This will drop the sightings table and insert default sightings
Modify server/queries/insertSightings.sql to start with other images

Images are hosted in s3

====

