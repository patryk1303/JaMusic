angular.module 'jaMusic1'
  .controller 'AlbumController', (Common, Albums, $stateParams, $rootScope, env) ->
    vm = @
    vm.loading = true
    vm.id = $stateParams.id

    vm.colors = Common.getColors()
    vm.downloadLink = "#{env.url}#{env.version}/albums/file/?client_id=#{env.clientId}&id=#{vm.id}"

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
