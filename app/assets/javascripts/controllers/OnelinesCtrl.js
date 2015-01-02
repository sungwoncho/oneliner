'use strict';

angular.module('oneliner')
  .controller('OnelinesCtrl', ['$scope', '$location', 'onelineFactory', function($scope, $location, onelineFactory, votes) {
    $scope.onelines = onelineFactory.query();
    $scope.page = 1;

    $scope.search = function(keyword) {
      $scope.onelines = onelineFactory.query({keyword: keyword})
    };

    $scope.newOneline = function() {
      $location.path("/onelines/new")
    };

    $scope.view = function(onelineId) {
      $location.path("/onelines/" + onelineId)
    };

    $scope.loadMore = function() {
      // If page limit is reached, do not proceed to query more data
      if ($scope.page_limit_reached) {
        return;
      }

      $scope.page++;
      $scope.busy = true;

      onelineFactory.query({page: $scope.page}, function(data) {
        if (data.length > 0) {

          // If server responds with non-empty array
          // push the data to onelines
          data.forEach(function(oneline) {
            $scope.onelines.push(oneline);
          })
        } else {

          // If response is empty
          // set the page_limit_reached to true
          $scope.page_limit_reached = true;
        }
      });

      $scope.busy = false;

    };

  }]);
