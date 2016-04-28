angular.module 'jaMusic1'
  .controller 'ArtistsController', (Common, Artists) ->
    vm = @
    vm.artistsLoading = false

    vm.searchArtists = () ->
      if vm.name and vm.name.length
        vm.artistsLoading = true
        Artists.searchArtist(vm.name)
          .then((res) ->
            vm.artists = res.results
          )
          .finally(->
            vm.artistsLoading = false
          )

    return
