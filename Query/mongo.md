# MongoDB Queries

## Schema

```txt
program_id:string
type:"Movie"|"TV Show"
title:string
description:string
duration: int|null
releaseYear: datetime
dateAdded: datetime
rating:string
directors:string[]
actors:string[]
countries:string[]
categories:string[]
```

## Number of TV Show/Movie by category

```json
[
  { "$match": { "type": "Movie" } }, // only select "Movie" or "TV Show"
  { "$unwind": "$categories" }, // deconstruct the categories array
  { "$group": { "_id": "$categories", "count": { "$sum": 1 } } }, // group by category and count
  { "$sort": { "count": -1 } } // sort by descending count
]
```

## Top 5/10 Directors that have the most TV Show/Movie with the following

```json
[
  { "$match": { "type": "Movie" } }, // only select "Movie" or "TV Show" or remove it
  { "$unwind": "$directors" }, // deconstruct the directors array
  { "$group": { "_id": "$directors", "count": { "$sum": 1 } } }, // group by director and count
  { "$sort": { "count": -1 } }, // sort by descending count
  { "$limit": 5 } // only return the top 5 or 10 directors
]
```

## Number of TV show/Movie by country

```json
[
  { "$match": { "type": "TV Show" } }, // only select "Movie" or "TV show"
  { "$unwind": "$countries" }, // deconstruct the countries array
  { "$group": { "_id": "$countries", "count": { "$sum": 1 } } }, // group by country and count
  { "$sort": { "count": -1 } } // sort by descending count
]
```

## TV Show/Movie that the actor has acted in

```json
// only select "Movie" or "TV show"
{ "type": "Movie", "actors": { "$elemMatch": { "$eq": "Tom Hanks" } } }
```

## Most featured actor in a given year

```json
[
  { $match: { releaseYear: ISODate("2021-01-01T00:00:00Z") } }, // only select "movies" from 2018
  { $project: { actors: 1 } }, // select only the actors field
  { $unwind: "$actors" }, // deconstruct the actors array
  { $group: { _id: "$actors", count: { $sum: 1 } } }, // group by actor and count
  { $sort: { count: -1 } }, // sort by descending count
  { $limit: 1 } // limit to the first result
]
```

## Total number of tv show by category and date added

```json
[
  {
    "$match": { "type": "Movie" }
  },
  {
    "$group": {
      "_id": { "year": { "$year": "$dateAdded" }, "category": "$categories" },
      "count": { "$sum": 1 }
    }
  },
  {
    "$sort": { "_id.year": 1 }
  }
]
```
