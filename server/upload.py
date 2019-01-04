import time
import hashlib

from flask import (
    Blueprint, flash, g, redirect, render_template, request, url_for,
    current_app
)
from werkzeug.utils import secure_filename
from server.auth import login_required
from server.aws import upload_file_to_s3
from server.db import get_db

bp = Blueprint('upload', __name__)
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'gif', 'mp4'])

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@bp.route('/upload', methods=['GET'])
@login_required
def upload():
    return render_template('upload/upload.html')

def generate_unique_filename(file):
    return get_file_hash(file) + get_current_timestamp() + "." + file.filename.rsplit('.', 1)[1]

def get_file_hash(file):
    hasher = hashlib.md5()
    buf = file.read()
    hasher.update(buf)
    file.seek(0) #return file current position back to beginning
    return hasher.hexdigest()

def get_current_timestamp():
    millis = int(round(time.time() * 1000))
    return str(millis)

@bp.route('/upload', methods=['POST'])
@login_required
def upload_file():
    if "user_file" not in request.files:
        return "No user_file key in request.files"
    file = request.files["user_file"]

    if file.filename == "":
        return "Please select a file"

    if file and allowed_file(file.filename):
        file.filename = generate_unique_filename(file)
        
        try:
            output = upload_file_to_s3(file, current_app.config["S3_BUCKET"])
        except Exception as e:
            return str(output)

        artist = request.form['artist']
        title = request.form['title']
        created_date = request.form['created_date']
        db = get_db()
        user_id = g.user['id']

        db.execute(
            'INSERT INTO sightings (user_id, url, artist, title, date_created) VALUES (?, ?, ?, ?, ?)',
            (user_id, output, artist, title, created_date)
        )
        db.commit()
        return "Finished uploading"

    else:
        return redirect("/upload")
