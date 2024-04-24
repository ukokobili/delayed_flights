import os
import pandas as pd
import boto3

def load_csv_convert_parquet(file_path):
    """Convert a CSV file to a Parquet file."""
    # Read the CSV file using pandas
    df = pd.read_csv(file_path)
    # Get the filename without the extension and add '.parquet' extension
    parquet_filename = os.path.splitext(os.path.basename(file_path))[0] + ".parquet"
    # Save the dataframe as a parquet file
    df.to_parquet(parquet_filename)
    # Return the path to the parquet file
    return parquet_filename

def upload_to_s3(file_path, bucket_name):
    """Upload a file to an S3 bucket."""
    s3_client = boto3.client('s3')
    file_key = os.path.basename(file_path)
    try:
        s3_client.upload_file(file_path, bucket_name, file_key)
        print(f"Uploaded {file_path} to S3 bucket {bucket_name} as {file_key}")
    except Exception as e:
        print(f"Failed to upload {file_path}. Error: {e}")

def run_extraction_load(files, bucket_name):
    """Convert CSV files to Parquet and upload them to S3."""
    # Loop through each file path
    for file_path in files:
        # Convert the CSV file to parquet and get the parquet file path
        parquet_path = load_csv_convert_parquet(file_path)
        # Upload the parquet file to S3
        upload_to_s3(parquet_path, bucket_name)
        # Optionally remove the local parquet file after upload
        os.remove(parquet_path)
        print(f"Deleted local file {parquet_path}")

if __name__ == "__main__":
    # S3 bucket name
    s3_bucket_name = "delayed-fligths"  

    # List of CSV files to process
    files_to_load = [
        "../data/us_flights_.csv",
        "../data/cancelled_diverted_.csv",
        "../data/weather_meteo_by_airport.csv",
        "../data/airports_geolocation.csv",
    ]
    # Run the extraction and loading process for all files
    run_extraction_load(files_to_load, s3_bucket_name)
