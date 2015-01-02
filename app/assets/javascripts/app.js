angular
  .module('oneliner', [
    'ngRoute',
    'ngResource',
    'templates',
    'angular-flash.service',
    'angular-flash.flash-alert-directive'
  ])
  .config(['$routeProvider', '$locationProvider', '$httpProvider', 'flashProvider', function($routeProvider, $locationProvider, $httpProvider, flashProvider) {

    flashProvider.errorClassnames.push("alert-danger");
    flashProvider.warnClassnames.push("alert-warning");
    flashProvider.infoClassnames.push("alert-info");
    flashProvider.successClassnames.push("alert-success");

    $routeProvider
      .when('/', {
        templateUrl: 'index.html',
        controller: 'OnelinesCtrl'
      })
      .when('/onelines/new', {
        templateUrl: 'form.html',
        controller: 'OnelineCtrl'
      })
      .when('/onelines/:onelineId', {
        templateUrl: 'show.html',
        controller: 'OnelineCtrl'
      })

    // Send CSRF token
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = angular.element('meta[name=csrf-token]').attr('content');

    $locationProvider.html5Mode(true);
  }]);
