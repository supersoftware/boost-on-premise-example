'use strict';
const db = require('@arangodb').db;
const collectionName = 'heroesCollection';

if (!db._collection(collectionName)) {
  db._createDocumentCollection(collectionName);
  db[collectionName].save({name: 'Spiderman', icon: 'https://assets.service.op/myapp/spiderman.png'});
  db[collectionName].save({name: 'Captain America', icon: 'https://assets.service.op/myapp/captainamerica.png'});
  db[collectionName].save({name: 'Batman', icon: 'https://assets.service.op/myapp/batman.png'});
  db[collectionName].save({name: 'Ironman', icon: 'https://assets.service.op/myapp/ironman.png'});
}
