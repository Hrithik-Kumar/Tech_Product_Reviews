if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test
import ast
import re
import pandas as pd

def replace_categories(row, individual_categories):
    row_category = row['category']
    
    if pd.isna(row_category):
        return row_category

    # Check if the category is a single word in individual_categories
    if row_category in individual_categories:
        return row_category

    # Try to evaluate the category as a list
    try:
        row_list = ast.literal_eval(row_category)
    except (SyntaxError, ValueError):
        # Handle the case where row_category is not a valid list literal
        return None
    
    # Check if the category matches any individual category
    for category in individual_categories:
        pattern = r'\b{}.'.format(category[:3])
        if any(re.search(pattern, word) for word in row_list):
            return category

    # Return the last item in the list, if the list is not empty
    if row_list:
        return row_list[-1]
    
    # Return None if the category is an empty list
    return None


@transformer
def transform(data, *args, **kwargs):
    
    # Specify your transformation logic here
    individual_categories = [category for category in data['category'].dropna() if '[' not in category]
    individual_categories = set(individual_categories)
    individual_categories.update({"kitchen and household","auto tech","laptops", 'printers','desktop pcs','projectors','monitors','scanners','keyboards','security'})
    data['category'] = data.apply(replace_categories, args=(individual_categories,), axis=1)

    print(data['category'].nunique())
    return data


@test
def test_output(output, *args) -> None:
    """
    Template code for testing the output of the block.
    """
    assert output is not None, 'The output is undefined'
