'use strict';

angular.module('oneliner')
  .factory('onelineFactory', ['$resource', function($resource) {
    return $resource('api/onelines/:onelineId', {onelineId: '@id', format: 'json'});
  }]);
