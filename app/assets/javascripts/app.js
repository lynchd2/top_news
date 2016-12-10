var app = angular.module( 'app', ['ui.router', 'restangular']);


app.config([
  'RestangularProvider',
  function(RestangularProvider) {

    RestangularProvider.setBaseUrl('/api/v1');
    RestangularProvider.setRequestSuffix('.json');
    RestangularProvider.setDefaultHttpFields({"content-type": "application/json"});
  }
  ]);

app.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider

  .state("news", {
  		url: "",
  		templateUrl: '/news/index.html',
      controller: 'NewsIndexCtrl', 
  })

}])