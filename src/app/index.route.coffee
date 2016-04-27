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
      .state 'radios',
        url: '/radios'
        templateUrl: 'app/radios/radios.html'
        controller: 'RadiosController'
        controllerAs: 'radios'
      .state 'player',
        url: '/player'
        templateUrl: 'app/player/player.html'
        controller: 'PlayerController'
        controllerAs: 'player'

    $urlRouterProvider.otherwise '/'
