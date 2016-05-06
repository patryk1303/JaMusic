angular.module 'jaMusic1'
  .controller 'ArtistController', (Common, Artists, $stateParams, Breadcrumbs, $rootScope) ->
    vm = @
    vm.tracksLoading = true
    vm.albumsLoading = true
    vm.id = $stateParams.id

    vm.colors = Common.getColors()

    Artists.getArtistTracks(vm.id)
      .then((res) ->
        if res.results.length
          vm.info = res.results[0]
          vm.tracks = vm.info.tracks
          breadcrumb =
            name: vm.info.name
            state: 'artist'
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      )
      .finally(->
        vm.tracksLoading = false
      )

    Artists.getArtistAlbums(vm.id)
      .then((res) ->
        if res.results.length
          vm.albums = res.results[0].albums
      )
      .finally(->
        vm.albumsLoading = false
      )

    return
