#!/bin/bash

rm -f queries/insertSightings.sql

sqlite3 sightings.db "drop table sightings;"
sqlite3 sightings.db < queries/createSightingsDB.sql

for filename in app/src/images/*
do
  echo "Extracting info for $filename"
  artJson=$(exiftool -ArtworkSource -ArtworkTitle -ArtworkCreator -ArtworkDateCreated -json "$filename")
  artist=$(echo "$artJson" | jq .[].ArtworkCreator)
  title=$(echo "$artJson" | jq .[].ArtworkTitle)

  if [[ -z "$artist" ]] && [[ -z "$title" ]]
  then
    echo "Skipped $artist $title"
  else
    url=$(echo "$artJson" | jq .[].SourceFile)
    museum=$(echo "$artJson" | jq .[].ArtworkSource)
    dateCreated=$(echo "$artJson" | jq .[].ArtworkDateCreated)
    visitDate=$(echo "$url" | grep -Eo '[[:digit:]]{8}');

    insertStatement=$(cat <<EOF
INSERT INTO sightings(user_name,sighting_date,url,museum_name,title,artist,date_created) values("Monica Tie",$visitDate,$url,$museum,$title,$artist,$dateCreated);)
    echo "$insertStatement" >> queries/insertSightings.sql
    echo "Finished generating insert statement for $title"
  fi
done

sqlite3 sightingsdb < queries/insertSightings.sql
