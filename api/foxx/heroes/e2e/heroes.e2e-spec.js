'use strict';

const assert = require('assert');

const request = require('@arangodb/request');

const HEROES_ENDPOINT = 'http://0.0.0.0:8529/_db/_system/api/heroes';

describe('Heroes E2E Test', () => {
  it('ヒーローを取得できていること', () => {
    // Arrange

    // Act
    const result = request.get(HEROES_ENDPOINT);

    // Assert
    assert.equal(result.statusCode, 200);
    const body = JSON.parse(result.body);
    assert.equal(body.length, 4);
  });
});
