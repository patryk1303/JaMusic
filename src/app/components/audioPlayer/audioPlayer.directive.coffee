angular.module 'jaMusic1'
  .directive 'player', ($rootScope) ->
    link = (scope, el, attr, controller) ->

      scope.playPause = () ->
        if $rootScope.p.audio.paused
          $rootScope.p.play()
        else
          $rootScope.p.pause()

      scope.changeProgress = (e) ->
        elWidth = el[0].querySelector('.track-progress').getBoundingClientRect().width
        if e.buttons is 1
          progress = e.offsetX / elWidth
          $rootScope.p.progress = progress

      scope.stop = () ->
        $rootScope.p.pause()
        $rootScope.p.currentTime = 0

      $rootScope.$watch('p.progress', (a,b) ->
        if $rootScope.p
          elProgress = el[0].querySelector '.audio-progress'
          progress = $rootScope.p.progress * 100

          if elProgress
            elProgress.style.width = "#{progress}%"

        if $rootScope.p.progress is 1 and $rootScope.p.duration > 0 and $rootScope.playlist.length
          $rootScope.p.stop()
          $rootScope.nextTrack()
      )

      return

    directive =
      restrict: 'EA'
      templateUrl: 'app/components/audioPlayer/audioPlayer.html'
      replace: true
      link: link

    directive
