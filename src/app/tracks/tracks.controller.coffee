angular.module 'jaMusic1'
  .controller 'TracksController', (Common, Tracks) ->
    vm = @
    vm.loading = true

    vm.colors = Common.getColors()

    vm.search = ->
      vm.loading = true
      Tracks.searchTracks(vm.name)
        .then((res) ->
          if res.results.length
            vm.tracks = res.results
        )
        .finally(->
          vm.loading = false
        )

    Tracks.searchTracks()
      .then((res) ->
        if res.results.length
          vm.tracks = res.results
      )
      .finally(->
        vm.loading = false
      )

    return
