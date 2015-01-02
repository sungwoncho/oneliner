angular.module('oneliner')
  .controller('OnelineCtrl', ['$scope', '$location', '$routeParams', 'onelineFactory', 'flash', function($scope, $location, $routeParams, onelineFactory, flash) {

    if ($routeParams.onelineId) {
      onelineFactory.get({ onelineId: $routeParams.onelineId }, function(oneline) {
        $scope.oneline = oneline;
      })
    }

    $scope.cancel = function() {
      $location.path("/")
    };

    $scope.back = function() {
      $location.path("/")
    };

    $scope.save = function() {
      onelineFactory.save($scope.oneline, function(newOneline) {
        // On success, redirect to the oneline
        $location.path('/onelines/' + newOneline.id);
      }, function(response) {
        // On failure, display flash
        flash.error = response.data.error;
      });
    };

    $scope.delete = function() {
      $scope.oneline.$delete();
      $scope.back();
    }

  }]);
