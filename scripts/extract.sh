#!/bin/bash

# Install the Kaggle package
pip install kaggle

# Automatically export all variables from the .env file
set -a
source .env
set +a

# Remove the existing data directory
rm -rf ../data

# Download the Kaggle dataset to the data directory
kaggle datasets download -d bordanova/2023-us-civil-flights-delay-meteo-and-aircraft --unzip -p "../data"

# Rename the extracted files to remove "2023" from the names and convert them to lowercase
for file in ../data/*2023*; do
    new_name="${file/2023/}"  # Remove '2023' from the filename
    mv "$file" "${new_name,,}"  # Convert filename to lowercase and move/rename
done
