angular.module 'jaMusic1'
  .controller 'PlayerController', (Common, Tracks, $rootScope, $sce, ngAudio, $stateParams) ->
    vm = @
    vm.trackId = $stateParams.trackId || 1204669

    if $rootScope.trackId isnt vm.trackId
      if $rootScope.p
        $rootScope.p.stop()
      $rootScope.trackId = vm.trackId

      Tracks.getTrackInfo(vm.trackId)
        .then((res) ->
          vm.trackInfo = res.results[0]
          $rootScope.trackInfo = res.results[0]
        )
      Tracks.getTrackFile(vm.trackId)
        .then((res) ->
          $rootScope.p = ngAudio.load(res.getAttribute('src'))
          $rootScope.p.play()
          window.p = res
        )

    return
