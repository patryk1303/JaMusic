angular.module 'jaMusic1'
  .controller 'PlaylistsController', (Playlists) ->
    'ngInject'
    vm = @

    Playlists.getPlaylists()
