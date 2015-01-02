angular.module('oneliner')
  .controller('OnelineCtrl', ['$scope', '$location', '$routeParams', 'onelineFactory', 'flash', 'votes', function($scope, $location, $routeParams, onelineFactory, flash, votes) {

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
    };

    var voteUpdate = function(response) {
      $scope.oneline.upvoted = response.data.upvoted;
      $scope.oneline.downvoted = response.data.downvoted;
      $scope.oneline.upvote_count = response.data.upvote_count;
      $scope.oneline.downvote_count = response.data.downvote_count;
    }

    $scope.upvote = function(onelineId) {
      votes.upvote(onelineId)
        .then(voteUpdate);
    };

    $scope.downvote = function(onelineId) {
      votes.downvote(onelineId)
        .then(voteUpdate);
    };

  }]);
