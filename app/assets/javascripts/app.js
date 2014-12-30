angular
  .module('oneliner', [
    'ngRoute',
    'templates'
  ])
  .config(['$routeProvider', function($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'index.html',
        controller: 'OnelinesCtrl'
      })
  }]);
