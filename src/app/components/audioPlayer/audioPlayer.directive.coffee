angular.module 'jaMusic1'
  .directive 'player', ($rootScope) ->
    link = (scope, el, attr, controller) ->
      console.log $rootScope

      scope.playPause = (_p) ->
        if _p.audio.paused
          _p.play()
        else
          _p.pause()

      scope.changeProgress = (e, p) ->
        elWidth = el[0].querySelector('.track-progress').getBoundingClientRect().width
        if e.buttons is 1
          progress = e.offsetX / elWidth
          p.progress = progress

      $rootScope.$watch('p.progress', () ->
        if $rootScope.p
          elProgress = el[0].querySelector '.audio-progress'
          progress = $rootScope.p.progress * 100

          if elProgress
            elProgress.style.width = "#{progress}%"
      )

      return

    directive =
      restrict: 'EA'
      templateUrl: 'app/components/audioPlayer/audioPlayer.html'
      replace: true
      link: link

    directive
