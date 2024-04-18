-- Check tech_reviews_table
SELECT * FROM `dezoomcamp-416915.tech_reviews.tech_reviews_data` LIMIT 10;

-- Create a non partitioned table from external table
CREATE OR REPLACE TABLE `dezoomcamp-416915.tech_reviews.tech_reviews_data_non_partitioned` AS
SELECT * FROM `dezoomcamp-416915.tech_reviews.tech_reviews_data`;

-- Create a partitioned table from external table
CREATE OR REPLACE TABLE `dezoomcamp-416915.tech_reviews.tech_reviews_data_partitioned`
PARTITION BY 
  DATE(date) AS
SELECT * FROM `dezoomcamp-416915.tech_reviews.tech_reviews_data`;

-- Impact of partition
-- Scanning 1.86 MB of data
SELECT DISTINCT(id)
FROM `dezoomcamp-416915.tech_reviews.tech_reviews_data_non_partitioned`
WHERE DATE(date) BETWEEN '2013-02-28' AND '2020-10-05';

-- Scanning 1.75 MB of data
SELECT DISTINCT(id)
FROM `dezoomcamp-416915.tech_reviews.tech_reviews_data_partitioned`
WHERE DATE(date) BETWEEN '2013-02-28' AND '2020-10-05';

-- Since the overall data size is not too big. So the partition does not help much

-- Creating a partition and cluster table
CREATE OR REPLACE TABLE `dezoomcamp-416915.tech_reviews.tech_reviews_data_partitioned_clustered`
PARTITION BY DATE(date)
CLUSTER BY publication AS
SELECT * FROM `dezoomcamp-416915.tech_reviews.tech_reviews_data`;

-- Query Scans 469.15 KB
SELECT COUNT(*) as num_reviews
FROM `dezoomcamp-416915.tech_reviews.tech_reviews_data_partitioned_clustered`
WHERE DATE(date) BETWEEN '2013-02-28' AND '2020-10-05'
AND publication='TechRadar';

-- Partitioning with Clustering help us run query fast


