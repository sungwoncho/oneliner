angular
  .module('oneliner', [
    'ngRoute',
    'templates'
  ])
  .config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'index.html',
        controller: 'OnelinesCtrl'
      });

    $locationProvider.html5Mode(true);
  }]);
