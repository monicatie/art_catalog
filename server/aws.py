from flask import current_app

def upload_file_to_s3(file, bucket_name, acl="public-read"):
    try:
        current_app.s3.upload_fileobj(
            file,
            bucket_name,
            file.filename
        )

    except Exception as e:
        # This is a catch all exception, edit this part to fit your needs.
        print("Something Happened: ", e)
        return e

    return current_app.config["S3_LOCATION"] + file.filename
