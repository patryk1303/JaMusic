angular.module 'jaMusic1'
  .controller 'TrackController', (Common, Tracks, $rootScope, $stateParams, ngAudio, Breadcrumbs, AudioPlayer) ->
    vm = @
    vm.trackId = parseInt $stateParams.trackId || -1
    vm.loading = false

    vm.playTrack = ->
      Tracks.getTrackFile(vm.trackId)
        .then((res) ->
          $rootScope.trackInfo = vm.trackInfo
          AudioPlayer.loadTrack(res)
        )
      return

    Tracks.getTrackInfo(vm.trackId)
      .then((res) ->
        vm.trackInfo = res.results[0]
        breadcrumb =
            name: vm.trackInfo.name
            state: 'track'
            idName: 'trackId'
            id: vm.trackId
          Breadcrumbs.pushBreadcrumb(breadcrumb)
          $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()
      )
      .finally(->
        vm.loading = false
      )

    return
