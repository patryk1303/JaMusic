angular.module 'jaMusic1'
  .controller 'PlayerController', (Common, Tracks, $rootScope, $sce, ngAudio) ->
    vm = @

    vm.playPause = (_p) ->
      if _p.audio.paused
        _p.play()
      else
        _p.pause()

    Tracks.getTrackInfo()
      .then((res) ->
        vm.trackInfo = res.results[0]
      )

    Tracks.getTrackFile()
      .then((res) ->
        # $rootScope.p = $sce.trustAsResourceUrl(res.getAttribute('src'))
        $rootScope.p = ngAudio.load(res.getAttribute('src'))
        # $rootScope.p.play()
        window.p = res
      )

    return
