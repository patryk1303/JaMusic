angular.module 'jaMusic1'
  .controller 'AlbumController', (Common, Albums, $stateParams) ->
    vm = @
    vm.loading = true
    vm.id = $stateParams.id

    vm.colors = Common.getColors()

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
