angular.module 'jaMusic1'
  .controller 'AlbumController', (Common, Albums, $stateParams, $rootScope) ->
    vm = @
    vm.loading = true
    vm.id = $stateParams.id

    vm.colors = Common.getColors()

    vm.loadPlaylist = ->
      $rootScope.playlist = vm.tracks
      $rootScope.changeTrack 0

    Albums.getAlbumTracks(vm.id)
      .then((res) ->
        if res.results.length
          vm.info = res.results[0]
          vm.tracks = vm.info.tracks
      )
      .finally(->
        vm.loading = false
      )

    return
