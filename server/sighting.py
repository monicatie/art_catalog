from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort

from server.db import get_db

bp = Blueprint('sighting', __name__)

@bp.route('/', methods=['GET', 'POST'])
def index():
    artist_sightings = None

    if request.method == 'POST':
        artist = request.form['artist']
        db = get_db()
        error = None

        if artist:
            artist_sightings = db.execute(
                'SELECT sighting_id, title, artist, date_created, museum_name, sighting_date, file_type, url, user_name FROM sightings WHERE artist LIKE ?', ('%'+artist+'%',)
            ).fetchall()

            if artist_sightings:
                return render_template('sightings/index.html', sightings=artist_sightings)
            else:
                error = 'No artists by the name of {}'.format(artist)

        if error is not None:
            flash(error)
    return render_template('sightings/index.html')

@bp.route('/artists')
def artists():
    db = get_db()
    results = db.execute(
        'SELECT DISTINCT artist FROM sightings ORDER BY artist'
    ).fetchall()

    return render_template('sightings/artists.html', results=results)