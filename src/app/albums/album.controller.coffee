angular.module 'jaMusic1'
  .controller 'AlbumController', (Common, Albums, $stateParams, $rootScope, env, Breadcrumbs) ->
    vm = @
    vm.loading = true
    vm.id = $stateParams.id

    vm.colors = Common.getColors()
    vm.downloadLink = "#{env.url}#{env.version}/albums/file/?client_id=#{env.clientId}&id=#{vm.id}"

    vm.downloadAsPlaylist = ->
      playlist = angular.toJson(vm.tracks)
      data = "text/json;charset=utf-8,#{playlist}"
      fileName = vm.info.name.replace /[ ]/g, '_'
      a = document.createElement 'a'
      a.href = "data:#{data}"
      a.download = "#{fileName}.json"
      a.click()

    Albums.getAlbumTracks(vm.id)
      .then((res) ->
        if res.results.length
          vm.info = res.results[0]
          vm.tracks = vm.info.tracks
          breadcrumb =
            name: vm.info.name
            state: 'album'
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      )
      .finally(->
        vm.loading = false
      )

    return
