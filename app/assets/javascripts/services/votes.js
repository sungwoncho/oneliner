'use strict';

angular.module('oneliner')
  .factory('votes', ['$http', function($http) {
    var api = {};

    api.upvote = function(onelineId) {
      var promise = $http.post('api/onelines/' + onelineId + '/votes?vote_type=up');
      return promise;
    };

    api.downvote = function(onelineId) {
      var promise = $http.post('api/onelines/' + onelineId + '/votes?vote_type=down');
      return promise;
    };

    return api;
  }]);
