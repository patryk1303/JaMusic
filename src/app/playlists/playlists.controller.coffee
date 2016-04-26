angular.module 'jaMusic1'
  .controller 'PlaylistsController', (Playlists) ->
    'ngInject'
    vm = @
    vm.loading = true

    Playlists.getPlaylists()
      .then((res) ->
        vm.playlists = res.results
      )
      .finally(->
        vm.loading = false
      )

    return
