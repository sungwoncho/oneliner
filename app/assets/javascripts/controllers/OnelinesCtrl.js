'use strict';

angular.module('oneliner')
  .controller('OnelinesCtrl', ['$scope', '$location', 'onelineFactory', 'votes', function($scope, $location, onelineFactory, votes) {
    $scope.onelines = onelineFactory.query();

    $scope.search = function(keyword) {
      $scope.onelines = onelineFactory.query({keyword: keyword})
    };

    $scope.newOneline = function() {
      $location.path("/onelines/new")
    };

    $scope.view = function(onelineId) {
      $location.path("/onelines/" + onelineId)
    };

    $scope.upvote = function(onelineId) {
      votes.upvote(onelineId)
    }

  }]);
