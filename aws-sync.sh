#!/bin/bash

aws s3 sync server/static/images/ s3://mt-art --exclude .DS_Store
