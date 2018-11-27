from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from server.db import get_db

bp = Blueprint('sighting', __name__)

@bp.route('/')
def index():
    db = get_db()
    sightings = db.execute(
        'SELECT sighting_id, title, artist, date_created, museum_name, sighting_date, url, user_name'
        ' FROM sightings'
        ' LIMIT 10'
    ).fetchall()
    return render_template('sightings/index.html', sightings=sightings)