# art_catalog

A flask app for cataloging artwork seen in travels

====
To start
Initialize venv with
  . venv/bin/activate

dev:
  pip install -r dev-requirements.txt
prod:
  pip install -r prod-requirements.txt

In the venv:
export FLASK_APP=server
export FLASK_ENV=development
flask run

====
To start the DB
flask init-db
This will drop the sightings table and insert default sightings
Modify server/queries/insertSightings.sql to start with other images

Images are hosted in s3

====
CONFIG
S3_*
  For uploading photos to s3. Set these configs in instance/config.py

====
DEPLOY

Generate a SECRET_KEY
If you already deployed with a generated SECRET_KEY, keep it :O so future stuff doesn't get signed with a different random SECRET_KEY

====

