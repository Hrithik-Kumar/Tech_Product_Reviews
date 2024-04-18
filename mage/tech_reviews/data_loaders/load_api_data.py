import io
import pandas as pd
import requests
if 'data_loader' not in globals():
    from mage_ai.data_preparation.decorators import data_loader
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@data_loader
def load_data_from_api(*args, **kwargs):
    """
    Template for loading data from API
    """
    url = 'https://www.dropbox.com/s/hxs7bm2pki5nez0/tech-reviews.csv?dl=1' 


    reviews_dtypes = {
        '_id': 'str', 
        'score': 'float64',
        'publication': 'str',
        'category': 'str',
        'article': 'str',
        'author': 'str',
        'title': 'str'
    }

    

    return pd.read_csv(url, sep=",", dtype=reviews_dtypes, parse_dates=['date'])


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
