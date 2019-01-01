import os
import boto3, botocore

from flask import Flask

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'server.sqlite'),
    )

    if test_config is not None:
        # load the test config if passed in
        app.config.from_mapping(test_config)
    else:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
        app.s3 = boto3.client(
            "s3",
            aws_access_key_id=app.config['S3_KEY'],
            aws_secret_access_key=app.config['S3_SECRET']
        )

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass
    
    from . import auth
    app.register_blueprint(auth.bp)

    from . import upload
    app.register_blueprint(upload.bp)

    from . import db
    db.init_app(app)

    from . import sighting
    app.register_blueprint(sighting.bp)
    app.add_url_rule('/', endpoint='index')

    return app
