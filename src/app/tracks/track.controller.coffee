angular.module 'jaMusic1'
  .controller 'TrackController', (Common, Tracks, $rootScope, $stateParams, ngAudio, Breadcrumbs) ->
    vm = @
    vm.trackId = parseInt $stateParams.trackId || -1
    vm.loading = false

    vm.playTrack = ->
      Tracks.getTrackFile(vm.trackId)
        .then((res) ->
          if $rootScope.p
            $rootScope.p.stop()
          $rootScope.trackInfo = vm.trackInfo
          $rootScope.p = ngAudio.load(res)
          $rootScope.p.play()
        )
      return

    Tracks.getTrackInfo(vm.trackId)
      .then((res) ->
        vm.trackInfo = res.results[0]
        breadcrumb =
            name: vm.trackInfo.name
            state: 'track'
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      )
      .finally(->
        vm.loading = false
      )

    return
