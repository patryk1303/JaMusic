angular.module 'jaMusic1'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'
      .state 'playlists',
        url: '/playlists'
        templateUrl: 'app/playlists/playlists.html'
        controller: 'PlaylistsController'
        controllerAs: 'playlists'

    $urlRouterProvider.otherwise '/'
