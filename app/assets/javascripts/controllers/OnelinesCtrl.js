'use strict';

angular.module('oneliner')
  .controller('OnelinesCtrl', ['$scope', 'onelineFactory', function($scope, onelineFactory) {
    $scope.onelines = onelineFactory.query();

    $scope.search = function(keyword) {
      $scope.onelines = onelineFactory.query({keyword: keyword})
    };
  }]);
