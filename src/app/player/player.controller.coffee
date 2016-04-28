angular.module 'jaMusic1'
  .controller 'PlayerController', (Common, Tracks, $rootScope, $sce, ngAudio) ->
    vm = @

    vm.playPause = (_p) ->
      if _p.audio.paused
        _p.play()
      else
        _p.pause()

    vm.changeProgress = (e, p) ->
      # TODO - move to directive
      elProgress = document.querySelector '.track-progress .progress'
      elWidth = 300
      if e.buttons is 1
        console.log e.offsetX

    $rootScope.$watch('p.progress', () ->
      elProgress = document.querySelector '.track-progress .progress'
      progress = $rootScope.p.progress * 100

      if elProgress
        elProgress.style.width = "#{progress}%"
    )

    Tracks.getTrackInfo()
      .then((res) ->
        vm.trackInfo = res.results[0]
      )

    if !$rootScope.p
      Tracks.getTrackFile()
        .then((res) ->
          # $rootScope.p = $sce.trustAsResourceUrl(res.getAttribute('src'))
          $rootScope.p = ngAudio.load(res.getAttribute('src'))
          # $rootScope.p.play()
          window.p = res
        )

    return
