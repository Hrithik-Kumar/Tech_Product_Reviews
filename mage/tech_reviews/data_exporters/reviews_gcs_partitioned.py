import pyarrow as pa 
import pyarrow.parquet as pq 
import os 

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter

os.environ['GOOGLE_APPLICATION_CREDENTIALS']="/home/src/mage-zoomcamp-key.json"

bucket_name = 'tech_reviews_dezoomcamp-416915_bucket'
project_id = 'dezoomcamp-416915'

table_name = 'tech_reviews_data_partitioned'

root_path = f'{bucket_name}/{table_name}'

@data_exporter
def export_data_to_google_cloud_storage(df, **kwargs) -> None:
    """
    Template for exporting data to a Google Cloud Storage bucket.
    Specify your configuration settings in 'io_config.yaml'.

    Docs: https://docs.mage.ai/design/data-loading#googlecloudstorage
    """
    # Extract year-month from 'date'
    df['year_month'] = df['date'].dt.to_period('M').astype(str)

    df['date'] = df['date'].dt.date

    table = pa.Table.from_pandas(df)

    gcs = pa.fs.GcsFileSystem()

    pq.write_to_dataset(
        table,
        root_path=root_path,
        partition_cols=['year_month'],
        filesystem=gcs
    )


