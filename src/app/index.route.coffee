angular.module 'jaMusic1'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'
        onEnter: (Breadcrumbs, $rootScope) ->
          Breadcrumbs.resetBreadcrumbs()
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      .state 'playlists',
        url: '/playlists'
        templateUrl: 'app/playlists/playlists.html'
        controller: 'PlaylistsController'
        controllerAs: 'playlists'
        onEnter: (Breadcrumbs, $rootScope) ->
          Breadcrumbs.resetBreadcrumbs()
          breadcrumb =
            name: 'Playlists'
            state: 'playlists'
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      .state 'playlist',
        url: '/playlist/:id'
        templateUrl: 'app/playlists/playlist.html'
        controller: 'PlaylistController'
        controllerAs: 'playlist'
      .state 'radios',
        url: '/radios'
        templateUrl: 'app/radios/radios.html'
        controller: 'RadiosController'
        controllerAs: 'radios'
        onEnter: (Breadcrumbs, $rootScope) ->
          Breadcrumbs.resetBreadcrumbs()
          breadcrumb =
            name: 'Radios'
            state: 'radios'
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      .state 'player',
        url: '/player?trackId'
        templateUrl: 'app/player/player.html'
        controller: 'PlayerController'
        controllerAs: 'player'
      .state 'artists',
        url: '/artists'
        templateUrl: 'app/artists/artists.html'
        controller: 'ArtistsController'
        controllerAs: 'artists'
        onEnter: (Breadcrumbs, $rootScope) ->
          Breadcrumbs.resetBreadcrumbs()
          breadcrumb =
            name: 'Artists'
            state: 'artists'
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      .state 'artist',
        url: '/artist/:id'
        templateUrl: 'app/artists/artist.html'
        controller: 'ArtistController'
        controllerAs: 'artist'
      .state 'tracks',
        url: '/tracks/:id'
        templateUrl: 'app/tracks/tracks.html'
        controller: 'TracksController'
        controllerAs: 'tracks'
        onEnter: (Breadcrumbs, $rootScope) ->
          Breadcrumbs.resetBreadcrumbs()
          breadcrumb =
            name: 'Tracks'
            state: 'tracks'
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      .state 'track',
        url: '/track/:trackId'
        templateUrl: 'app/tracks/track.html'
        controller: 'TrackController'
        controllerAs: 'track'
      .state 'albums',
        url: '/albums'
        templateUrl: 'app/albums/albums.html'
        controller: 'AlbumsController'
        controllerAs: 'albums'
        onEnter: (Breadcrumbs, $rootScope) ->
          Breadcrumbs.resetBreadcrumbs()
          breadcrumb =
            name: 'Albums'
            state: 'albums'
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      .state 'album',
        url: '/album/:id'
        templateUrl: 'app/albums/album.html'
        controller: 'AlbumController'
        controllerAs: 'album'

    $urlRouterProvider.otherwise '/'
