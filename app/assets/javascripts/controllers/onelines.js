'use strict';

angular.module('oneliner')
  .controller('OnelinesCtrl', ['$scope', function($scope) {
    $scope.messages = [
      'yo',
      'this is',
      'working'
    ]
  }]);
