angular.module 'jaMusic1'
  .controller 'PlayerController', (Common, Tracks, $rootScope, $sce, ngAudio, $stateParams) ->
    vm = @
    vm.trackId = parseInt $stateParams.trackId || 1204669
    vm.trackLoading = false

    if parseInt($rootScope.trackId) isnt vm.trackId
      if $rootScope.p
        $rootScope.p.stop()
      $rootScope.trackId = vm.trackId

      vm.trackLoading = true

      Tracks.getTrackInfo(vm.trackId)
        .then((res) ->
          vm.trackInfo = res.results[0]
          $rootScope.trackInfo = res.results[0]
        )
      Tracks.getTrackFile(vm.trackId)
        .then((res) ->
          $rootScope.p = ngAudio.load(res)
          $rootScope.p.play()
        )
        .finally(->
          vm.trackLoading = false
        )

    Tracks.getTrackReviews(vm.trackId)
      .then((res) ->
        vm.reviews = res.results
      )
      .finally(->
        vm.trackLoading = false
      )

    return
