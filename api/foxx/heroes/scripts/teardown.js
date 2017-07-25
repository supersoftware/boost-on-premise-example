'use strict';
const db = require('@arangodb').db;
const collectionName = 'heroesCollection';

if (db._collection(collectionName)) {
  db._drop(collectionName);
}
