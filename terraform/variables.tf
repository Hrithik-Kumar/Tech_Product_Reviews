variable "credentials" {
  description = "My Credentials"
  default     = "./keys/my-creds.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}


variable "project" {
  description = "Project"
  default     = "dezoomcamp-416915"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "us-central1"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset for the Tech Publication Reviews data"
  #Update the below to what you want your dataset to be called
  default     = "tech_reviews"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket for Tech Publication Reviews data"
  #Update the below to a unique bucket name
  default     = "tech_reviews_dezoomcamp-416915_bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}