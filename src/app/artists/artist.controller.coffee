angular.module 'jaMusic1'
  .controller 'ArtistController', (Common, Artists, $stateParams) ->
    vm = @
    vm.artistLoading = true
    vm.id = $stateParams.id

    vm.colors = Common.getColors()

    Artists.getArtistTracks(vm.id)
      .then((res) ->
        if res.results.length
          vm.info = res.results[0]
          vm.tracks = vm.info.tracks
      )
      .finally(->
        vm.artistLoading = false
      )

    return
