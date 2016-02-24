var chai = require('chai'),
    chai_promise = require('chai-as-promised'),
    GithubApi = require('../..');

var should = chai.should();
chai.use(chai_promise);

global.API = new GithubApi().build();
global.should = should;
