angular.module 'jaMusic1'
  .controller 'PlayerController', (Common, Tracks, $rootScope, $sce) ->
    vm = @

    Tracks.getTrackFile()
      .then((res) ->
        $rootScope.p = $sce.trustAsResourceUrl(res.getAttribute('src'))
        window.p = res
        console.log res
        console.log 'test it!'
      )

    return
