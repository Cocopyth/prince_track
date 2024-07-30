#!/bin/bash

# Check if the user has provided a path
if [ -z "$1" ]; then
	  echo "Usage: $0 <path>"
	    exit 1
    fi

    # Assign the first argument to the variable DEST_PATH
    DEST_PATH=$1

    # Define the URL to the Figshare file
    FILE_URL="https://figshare.com/ndownloader/files/41905245"

    # Create the destination directory if it does not exist
    mkdir -p "$DEST_PATH"

    # Define the name of the downloaded file
    ZIP_FILE="$DEST_PATH/file.zip"

    # Download the file
    echo "Downloading file from $FILE_URL..."
    curl -L -o "$ZIP_FILE" "$FILE_URL"

    # Check if the download was successful
    if [ $? -ne 0 ]; then
	      echo "Download failed. Exiting."
	        exit 1
	fi

	# Check if the downloaded file is a zip file
	FILE_TYPE=$(file -b --mime-type "$ZIP_FILE")
	if [ "$FILE_TYPE" != "application/zip" ]; then
		  echo "Downloaded file is not a zip file. Exiting."
		    rm "$ZIP_FILE"
		      exit 1
	      fi

	      # Unzip the file to the destination path
	      echo "Unzipping file to $DEST_PATH..."
	      unzip -o "$ZIP_FILE" -d "$DEST_PATH"

	      # Check if the unzip was successful
	      if [ $? -ne 0 ]; then
		        echo "Unzipping failed. Exiting."
			  exit 1
		  fi

		  # Remove the downloaded zip file
		  rm "$ZIP_FILE"

		  # Delete all files containing "TileConfiguration" in their names
		  find "$DEST_PATH" -type f -name "*TileConfiguration*" -exec rm -f {} \;

		  # Delete all files within any "Analysis" folder
		  find "$DEST_PATH" -type d -name "Analysis" -exec rm -rf {} \;

		  echo "Done. The file has been downloaded, unzipped, and cleaned up in $DEST_PATH."

