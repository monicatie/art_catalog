# art_catalog

A flask app for cataloging artwork seen in travels

====
To start
Initialize venv
pip install -r requirements.txt

In the venv:
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
DEPLOY

Generate a SECRET_KEY
If you already deployed with a generated SECRET_KEY, keep it :O so future stuff doesn't get signed with a different random SECRET_KEY

Initialize venv with
pip install -r prod-requirements.txt
====

