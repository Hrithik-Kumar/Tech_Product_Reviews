# Tech Product Reviews

## Project Description

This project is part of the [Data Engineering Zoomcamp](https://github.com/DataTalksClub/data-engineering-zoomcamp) for 2024 Cohort. 
This project contains an end-to-end data pipeline written in Python. 


**Data** 

The project used the data from [Components](https://components.one/datasets/tech-reviews-dataset), which consists of 28,000 product reviews from PCMag, CNET, Tech Radar and Trusted Reviews, covering the period from the beginning of 2013 to the end of 2020. The data is approximately 212 MB in size. The dataset comprises various attributes such as product score, article URL, text, title, author, date, and product category when applicable. 

> **Disclaimer:** The datasets used for this project are relatively smalls datasets. The main idea of this project wasn't to deal with a big dataset at this point, but rater build a pipeline that can fetch, organize and transform present data. But above all, to answer some questions that arose during the formulation of the problem.

**Pipeline description:**
1. Pipeline fetches the data from online source
2. It then conducts a basic transformation on the dataset and uploads it to Google Cloud Storage
3. The data is then loaded from GCS, fully tranformed and then upload to BigQuery in the form of tables
4. The tables are created using partitioning and clustering for better query performace 

Steps 1-3 are orchestrated in [Mage](https://docs.mage.ai/introduction/overview)

**Goal**
The examination aims to discern patterns within product reviews across diverse publications. It's valuable to ascertain which brands receive higher average scores in these reviews. Additionally, we seek to track the evolving popularity of product categories over time and to identify key authors contributing to tech reviews.

## Tools

1. **Cloud:**
   
   - [Google Cloud Platform (GCP)](https://cloud.google.com/?utm_source=bing&utm_medium=cpc&utm_campaign=latam-AR-all-es-dr-BKWS-all-all-trial-e-dr-1707800-LUAC0016410&utm_content=text-ad-none-any-DEV_c-CRE_-ADGP_Hybrid+%7C+BKWS+-+MIX+%7C+Txt_+GCP-General-KWID_43700067403123893-kwd-77859523038025:loc-8&utm_term=KW_Google+Cloud+Platform-ST_Google+Cloud+Platform&gclid=f110f2a74b1b1da673c894aa2e0948fa&gclsrc=3p.ds&hl=en)
   
   - [Terraform (IaC)](https://www.terraform.io/)

2. **Data Ingestion (batch):**
   
   - [Mage](https://www.mage.ai/)

3. **Data Lake:**
   
   - [Google Cloud Storage](https://cloud.google.com/storage?hl=en)

4. **Data Transformations and Processing:**
   
   - [dbt](https://www.getdbt.com/)

5. **Data Warehousing:**
   
   - [Google BigQuery](https://cloud.google.com/bigquery?hl=en)

6. **Dashboarding:**
   
   - [Google Looker Studio](https://lookerstudio.google.com/overview)


### Folder navigation

#### `./code`

**- tech_reviews_exploration.ipynb**

Notebook with Python script for data exploration.

**- tech_reviews_queries.sql**

SQL queries for create tables in BigQuery before dbt use.

#### `./data`

**- tech-review.zip**

The zip file contains the dataset used for analysis

#### `./dbt`

Sub folders and files for the whole dbt project.

#### `./images`

Various images of mage pipelines and dbt models, among other things


#### `./looker_studio`

Dashboard resulting from the design in looker studio and access link.

#### `./mage`

Sub folders and files for the whole mage project.

#### `./terraform`

**- main.tf**

Main configuration file for Terraform, defining the infrastructure as code to provision (or destroy) all the necessary resources in the cloud.

**- variables.tf**

File containing variable definitions used in the main Terraform file (main.tf), facilitating code customization and reuse.



