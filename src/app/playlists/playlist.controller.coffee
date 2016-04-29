angular.module 'jaMusic1'
  .controller 'PlaylistController', (Playlists, Common, $stateParams, $state, $rootScope) ->
    vm = @
    vm.loading = true
    vm.id = $stateParams.id

    vm.colors = Common.getColors()

    Playlists.getPlaylist(vm.id)
      .then((res) ->
        vm.tracks = res.results
        if !vm.tracks.length
          alert 'Playlist is empty'
          $state.go 'playlists'
        else
          vm.tracks = vm.tracks[0]
      )
      .finally(->
        vm.loading = false
      )

    return
