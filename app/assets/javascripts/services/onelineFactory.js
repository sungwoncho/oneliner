'use strict';

angular.module('oneliner')
  .factory('onelineFactory', ['$resource', function($resource) {
    return $resource('/onelines/:onelineId', {onelineId: '@id', format: 'json'});
  }]);
