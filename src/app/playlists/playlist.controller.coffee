angular.module 'jaMusic1'
  .controller 'PlaylistController', (Playlists, Common, $stateParams, $state, $rootScope, Breadcrumbs) ->
    vm = @
    vm.loading = true
    vm.id = $stateParams.id

    vm.colors = Common.getColors()

    vm.download = ->
      playlist = angular.toJson(vm.tracks.tracks)
      data = "text/json;charset=utf-8,#{playlist}"
      fileName = vm.tracks.name.replace /[ ]/g, '_'
      a = document.createElement 'a'
      a.href = "data:#{data}"
      a.download = "#{fileName}.json"
      a.click()

    Playlists.getPlaylist(vm.id)
      .then((res) ->
        vm.tracks = res.results
        if !vm.tracks.length
          alert 'Playlist is empty'
          $state.go 'playlists'
        else
          vm.tracks = vm.tracks[0]
          breadcrumb =
            name: vm.tracks.name
            state: 'playlist'
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      )
      .finally(->
        vm.loading = false
      )

    return
