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

      scope.changeVolume = (e) ->
        elWidth = el[0].querySelector('.volume').getBoundingClientRect().width
        if e.buttons is 1
          volume = e.offsetX / elWidth
          volume = 0 if volume < 0
          $rootScope.p.volume = volume

      scope.stop = () ->
        $rootScope.p.pause()
        $rootScope.p.currentTime = 0

      $rootScope.$watch('p.progress', ->
        if $rootScope.p
          elProgress = el[0].querySelector '.audio-progress'
          progress = $rootScope.p.progress * 100

          if elProgress
            elProgress.style.width = "#{progress}%"
      )

      $rootScope.$watch('p.volume', ->
        elVolume = el[0].querySelector '.volume-bar'
        volume = $rootScope.p.volume * 100

        if elVolume
          elVolume.style.width = "#{volume}%"
      )

      return

    directive =
      restrict: 'EA'
      templateUrl: 'app/components/audioPlayer/audioPlayer.html'
      replace: true
      link: link

    directive
