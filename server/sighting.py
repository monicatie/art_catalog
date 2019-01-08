from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for
)
from werkzeug.exceptions import abort
from pypika import Query, Table, Field

from server.db import get_db

bp = Blueprint('sighting', __name__)

@bp.route('/', methods=['GET'])
def index():
    results = None
    error = None

    artist = request.args.get('artist')
    title = request.args.get('title')
    museum = request.args.get('museum')

    if artist or title or museum:
        db = get_db()
        sightings = Table('sightings')

        q = Query.from_(
                sightings
            ).select(
                'sighting_id', 'title', 'artist', 'date_created', 'museum_name', 'sighting_date', 'url'
            ).where(
                sightings.user_id == g.user['id']
            )

        if artist:
            q = q.where(
                    sightings.artist.like('%'+artist+'%')
                )
        if title:
            q = q.where(
                    sightings.title.like('%'+title+'%')
                )
        if museum:
            q = q.where(
                    sightings.museum_name.like('%'+museum+'%')
                )

        results = db.execute(q.get_sql()).fetchall()

        if results:
            return render_template('sightings/index.html', sightings=results)
        else:
            error = 'No results found'

    if error is not None:
        flash(error)
    return render_template('sightings/index.html')

@bp.route('/artists')
def artists():
    db = get_db()

    sightings = Table('sightings')
    q = Query.from_(sightings).select(
            'artist'
        ).where(
            sightings.user_id == g.user['id']
        ).orderby('artist').distinct()

    results = db.execute(q.get_sql()).fetchall()

    return render_template('sightings/artists.html', results=results)