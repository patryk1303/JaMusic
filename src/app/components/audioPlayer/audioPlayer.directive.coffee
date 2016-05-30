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

      scope.$watch('progress', (a) ->
        AudioPlayer.setProgress(a)
      )

      scope.$watch('volume', (a) ->
        AudioPlayer.setVolume(a)
      )

      scope.$watch(
        () -> AudioPlayer.getProgress(),
        () -> scope.progress = AudioPlayer.getProgress()
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
        () -> scope.volume = AudioPlayer.getVolume()
      )

      return

    directive =
      restrict: 'EA'
      templateUrl: 'app/components/audioPlayer/audioPlayer.html'
      replace: true
      link: link

    directive
