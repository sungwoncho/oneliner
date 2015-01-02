'use strict';

angular.module('oneliner')
  .factory('votes', ['$http', function($http) {
    var api = {};

    api.upvote = function(onelineId) {
      $http.post('api/onelines/' + onelineId + '/votes?vote_type=up')
    };

    api.downvote = function(onelineId) {
      $http.post('api/onelines/' + onelineId + '/votes?vote_type=down')
    };

    return api;
  }]);
