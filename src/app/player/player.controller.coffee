angular.module 'jaMusic1'
  .controller 'PlayerController', (Common, Tracks, $rootScope, $sce, ngAudio) ->
    vm = @

    Tracks.getTrackInfo()
      .then((res) ->
        vm.trackInfo = res.results[0]
        $rootScope.trackInfo = res.results[0]
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
