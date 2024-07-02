/* global use, db */
// MongoDB Playground
// To disable this template go to Settings | MongoDB | Use Default Template For Playground.
// Make sure you are connected to enable completions and to be able to run a playground.
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.
// The result of the last command run in a playground is shown on the results panel.
// By default the first 20 documents will be returned with a cursor.
// Use 'console.log()' to print to the debug output.
// For more documentation on playgrounds please refer to
// https://www.mongodb.com/docs/mongodb-vscode/playgrounds/

// Select the database to use.
use('SPRINT_9');

ej1= db.comments.find().projection({"text" : 1}).limit(2)
//print(ej1)

ej2 = db.users.countDocuments()
//print(ej2)

ej3 = db.theaters.countDocuments({'location.address.state': 'CA'});
//print(ej3)

ej4 = db.users.findOne()
//print(ej4)

ej5= db.movies.countDocuments({ 'genres': 'Comedy' });
//print(ej5)

ej6 = db.movies.find({$and: [{$or: [{ genres: 'Drama' },{languages: 'French'}]}, { year: 1932 }]});
//print(ej6)

ej7 = db.movies.find({
  $and: [
    { countries: 'USA' },
    { 'awards.wins': { $gte: 5, $lte: 9 } },
    { year: { $gte: 2012, $lte: 2014 } }
  ]
});
//print(ej7)

ej8 = db.comments.countDocuments({email: { $regex: '(?i)@gameofthron.es' }});
//print(ej8)

ej9 = db.theaters.aggregate(
  [{'$match': {'location.address.state': 'DC'}}, 
    {'$group': {'_id': '$location.address.zipcode','cantidad': {'$count': {}}}}],
  { maxTimeMS: 60000, allowDiskUse: true });

//print(ej9)

ej10 = db.movies.find({
  $and: [
    { directors: 'John Landis' },
    { 'imdb.rating': { $gte: 7.5, $lte: 8 } }
  ]
});
print(ej10)