angular.module 'jaMusic1'
  .controller 'PlayerController', (Common, Tracks, $rootScope, $sce, ngAudio, $stateParams, Breadcrumbs) ->
    vm = @
    vm.trackId = parseInt $stateParams.trackId || -1
    vm.trackLoading = false

    if parseInt($rootScope.trackId) isnt vm.trackId
      if $rootScope.p
        $rootScope.p.stop()
      $rootScope.trackId = vm.trackId
      $rootScope.trackIndex = -1

      vm.trackLoading = true

      if vm.trackId >= 0
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


    breadcrumb =
      name: 'Player'
      state: 'player'
      idName: 'trackId'
      id: vm.trackId
    Breadcrumbs.pushBreadcrumb(breadcrumb)
    $rootScope.breadcrumbs = Breadcrumbs.getBreadcrumbs()

    # Tracks.getTrackReviews(vm.trackId)
    #   .then((res) ->
    #     vm.reviews = res.results
    #   )
    #   .finally(->
    #     vm.trackLoading = false
    #   )

    return
