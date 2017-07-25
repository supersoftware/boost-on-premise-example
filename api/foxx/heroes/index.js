'use strict';
const createRouter = require('@arangodb/foxx/router');
const router = createRouter();
module.context.use(router);

const db = require('@arangodb').db;
const heroesColl = db._collection('heroesCollection');

const joi = require('joi');

router.get('/heroes', (req, res) => {
    const result = heroesColl.all();
    res.send(result);
  })
  .response(joi.array().items(
    joi.array().items(joi.object().required())
  ).required(), 'List of heroes.')
  .summary('List heroes')
  .description('Assembles a list of heroes in the collection.');