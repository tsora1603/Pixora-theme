#!/bin/bash

set -e
BASE_DIR="folder-colors"
DEST_DIR="./16/places"

if [ ! -d "$BASE_DIR" ]; then
	echo "Directory $BASE_DIR not found!"
	exit 1
fi

cd $BASE_DIR
echo "Please choose a color:"
select folder in $(ls -d *); do
	if [ -n "$folder" ]; then
		echo "You selected: $folder"
		SELECTED_FOLDER=$(basename $folder)
		break
	else
		echo "Invalid selection, please try again."
	fi
done

cd ../

SOURCE_DIR="$BASE_DIR/$SELECTED_FOLDER/16/places"
if [ ! -d "$SOURCE_DIR" ]; then
	echo "The directory $SOURCE_DIR does not exist!"
	exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
	echo "The destination directory $DEST_DIR does not exist!"
	exit 1
fi

echo "Copying files from $SOURCE_DIR to $DEST_DIR..."
cp -vrf $SOURCE_DIR/* $DEST_DIR/

rm -rv 128/places
./compile-icons.sh
