import os
import pandas as pd
import duckdb as db


def load_csv_convert_parquet(file_path):
    """Convert a CSV file to a Parquet file."""
    # Read the CSV file using pandas
    df = pd.read_csv(file_path)
    # Get the filename without the extension and add '.parquet' extension
    parquet_filename = os.path.splitext(
        os.path.basename(file_path))[0] + ".parquet"
    # Save the dataframe as a parquet file
    df.to_parquet(parquet_filename)
    # Return the path to the parquet file
    return parquet_filename


def create_table_from_parquet(parquet_path, table_name, db_path):
    """Create a table in DuckDB from a Parquet file."""
    # Define the SQL query to create the table from the parquet file
    query = f"""
          CREATE OR REPLACE TABLE {table_name} AS
          SELECT *
          FROM parquet_scan('{parquet_path}')
        """
    # Connect to the DuckDB database
    with db.connect(db_path) as con:
        # Execute the SQL query to create the table
        con.execute(query)


def run_extraction_load(files, db_path="../oltp/local_dev.db"):
    """Load multiple CSV files, convert to Parquet, and write to DuckDB."""
    # Loop through each file and table name
    for file_path, table_name in files.items():
        # Convert the CSV file to parquet and get the parquet file path
        parquet_path = load_csv_convert_parquet(file_path)
        # Create a table in DuckDB from the parquet file
        create_table_from_parquet(parquet_path, table_name, db_path)


if __name__ == "__main__":
    # Define a dictionary of file paths and table names
    files_to_load = {
        "../data/us_flights_.csv": "us_flights",
        "../data/cancelled_diverted_.csv": "cancelled_diverted",
        "../data/weather_meteo_by_airport.csv": "weather_meteo_by_airport",
        "../data/airports_geolocation.csv": "airports_geolocation",
    }
    # Run the extraction and loading process for all files
    run_extraction_load(files_to_load)