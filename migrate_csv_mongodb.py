"""
This script is used to migrate the data from the CSV file to MongoDB
"""
import csv
import json
from datetime import datetime

import pymongo

# Connect to MongoDB
client = pymongo.MongoClient("mongodb://admin:asdqwe123@localhost:27017/")
db = client["csc2008csv"]
collection = db["program"]

with open('./Data/netflix_titles.csv', 'r', encoding='utf8') as csvfile:
    # Create a CSV reader object
    reader = csv.DictReader(csvfile)
    # Create an empty list to store the data
    data = []
    # Iterate over each row in the CSV file
    for row in reader:
        # Create a dictionary to store the data for this row
        item = {}
        # Map the values to the corresponding keys
        item['program_id'] = row['show_id'].strip()
        item['type'] = row['type'].strip()
        item['title'] = row['title'].strip()
        item['description'] = row['description'].strip()
        item['duration'] = row['duration'].strip().split(' ')[0]
        item['releaseYear'] = datetime.combine(
            datetime.strptime(
                row['release_year'], '%Y'), datetime.min.time())
        if row['date_added']:
            item['dateAdded'] = datetime.combine(datetime.strptime(
                row['date_added'].strip(), '%B %d, %Y'), datetime.min.time())
        item['rating'] = row['rating']
        item['directors'] = row['director'].strip().split(
            ', ') if row['director'] else []
        item['actors'] = row['cast'].strip().split(', ') if row['cast'] else []
        item['countries'] = row['country'].strip().split(
            ', ') if row['country'] else []
        item['categories'] = row['listed_in'].strip().split(
            ', ') if row['listed_in'] else []
        data.append(item)
    # insert the documents
    if len(data) > 0:
        collection.insert_many(data)
