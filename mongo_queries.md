# MongoDB Queries

## In MongoDB Chart

### Total Number of Programs by Category

```json
[
  { "$unwind": "$categories" }, // deconstruct the categories array
  { "$group": { "_id": "$categories", "count": { "$sum": 1 } } } // group by category and count
]
```

### Top 10 Most Prolific Directors

```json
[
  { "$unwind": "$directors" }, // deconstruct the directors array
  { "$group": { "_id": "$directors", "count": { "$sum": 1 } } }, // group by director and count
  { "$limit": 10 } // only return the top 5 or 10 directors
]
```

### Total Number of Programs Streaming by Country

```json
[
  { "$unwind": "$countries" }, // deconstruct the countries array
  { "$group": { "_id": "$countries", "count": { "$sum": 1 } } } // group by country and count
]
```

### Most Featured Actor in 2021

Not Optimised

```json
[
  { $match: { releaseYear: ISODate("2021-01-01T00:00:00Z") } }, // only select from 2021
  { $project: { actors: 1 } }, // select only the actors field
  { $unwind: "$actors" }, // deconstruct the actors array
  { $group: { _id: "$actors", count: { $sum: 1 } } }, // group by actor and count
  { $sort: { count: -1 } }, // sort by descending count
  { $limit: 1 } // limit to the first result
]
```

Optimised

```json
[
  { $match: { releaseYear: ISODate("2021-01-01T00:00:00Z") } },
  { $unwind: "$actors" }, // deconstruct the actors array
  { $group: { _id: "$actors", count: { $sum: 1 } } }, // group by actor and count
  { $sort: { count: -1 } }, // sort by descending count
  { $limit: 1 } // limit to the first result
]
```

### Total Number of Programs by Category and Date Added

Optimised

```json
[
  {
    "$group": {
      "_id": { "year": { "$year": "$dateAdded" }, "category": "$categories" },
      "count": { "$sum": 1 }
    }
  }
]
```

Not Optimised

```json
[
  {
    "$project": {
      "year": { "$year": "$dateAdded" },
      "categories": 1
    }
  },
  {
    "$group": {
      "_id": { "year": "$year", "category": "$categories" },
      "count": { "$sum": 1 }
    }
  }
]
```

## Not In MongoDB Chart

### Insert Program

```js
db.program.InsertOne({
  program_id: "123",
  type: "Movie",
  title: "The Godfather",
  description: "ABC",
  duration: 175,
  releaseYear: ISODate("2020-03-24T00:00:00Z"),
  dateAdded: ISODate("2022-03-16T00:00:00Z"),
  rating: "R",
  directors: ["Francis Ford Coppola"],
  actors: ["Marlon Brando", "Al Pacino", "James Caan"],
  countries: ["United States"],
  categories: ["Crime", "Drama"],
});
```

### Update Program

```js
db.program.updateOne(
  { program_id: "123" },
  {
    $set: {
      title: "The Godfather Part II",
      description: "EFG",
      rating: "R",
      actors: ["Al Pacino", "Robert De Niro:"],
      categories: ["Crime", "Drama"],
      dateAdded: ISODate("2022-03-16T00:00:00Z"),
    },
  }
);
```

### Delete Program

```js
db.program.deleteOne({ program_id: "123" });
```
