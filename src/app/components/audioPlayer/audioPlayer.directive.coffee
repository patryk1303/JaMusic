angular.module 'jaMusic1'
  .directive 'player', ($rootScope, AudioPlayer) ->
    link = (scope, el, attr, controller) ->

      scope.playPause = AudioPlayer.playPause
      scope.stop = AudioPlayer.stop
      scope.isPaused = AudioPlayer.isPaused
      scope.progress = AudioPlayer.getProgress()
      scope.duration = AudioPlayer.getDuration()
      scope.currentTime = AudioPlayer.getCurrentTime()
      scope.volume = AudioPlayer.getVolume()

      elProgress = el[0].querySelector '.range-progress'
      elProgressBar = elProgress.querySelector '.progress-bar'
      elVolume = el[0].querySelector '.range-volume'
      elVolumeBar = elVolume.querySelector '.progress-bar'

      scope.$watch('progress', (a) ->
        AudioPlayer.setProgress(a)
      )

      scope.$watch('volume', (a) ->
        AudioPlayer.setVolume(a)
      )

      scope.$watch(
        () -> AudioPlayer.getProgress(),
        () ->
          progress = AudioPlayer.getProgress()
          elProgressBar.style.width = "#{Math.ceil(progress * 100)}%"
          scope.progress = progress
      )

      scope.$watch(
        () -> AudioPlayer.getDuration(),
        () -> scope.duration = AudioPlayer.getDuration()
      )

      scope.$watch(
        () -> AudioPlayer.getCurrentTime(),
        () -> scope.currentTime = AudioPlayer.getCurrentTime()
      )

      scope.$watch(
        () -> AudioPlayer.getVolume(),
        () ->
          volume = AudioPlayer.getVolume()
          elVolumeBar.style.width = "#{Math.round(volume * 100)}%"
          scope.volume = volume
      )

      changeProgress = (e) ->
        if e.buttons is 1 or e.type is 'click'
          perc = e.offsetX / elProgress.getBoundingClientRect().width
          scope.progress = perc

      changeVolume = (e) ->
        if e.buttons is 1 or e.type is 'click'
          perc = e.offsetX / elVolume.getBoundingClientRect().width
          scope.volume = perc

      elProgress.addEventListener 'mousemove', changeProgress
      elProgress.addEventListener 'click', changeProgress

      elVolume.addEventListener 'mousemove', changeVolume
      elVolume.addEventListener 'click', changeVolume

      return

    directive =
      restrict: 'EA'
      templateUrl: 'app/components/audioPlayer/audioPlayer.html'
      replace: true
      link: link

    directive
