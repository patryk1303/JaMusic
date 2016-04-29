angular.module 'jaMusic1'
  .run ($log, $rootScope, Tracks, ngAudio) ->
    'ngInject'
    $log.debug 'runBlock end'

    $rootScope.playlist = []

    $rootScope.addToPlaylist = (track) ->
      $rootScope.playlist.push track

    $rootScope.changeTrack = (track) ->
      if $rootScope.p
        $rootScope.p.stop()
      Tracks.getTrackInfo(track.id)
        .then((res) ->
          $rootScope.trackInfo = res.results[0]
        )
      Tracks.getTrackFile(track.id)
        .then((res) ->
          $rootScope.p = ngAudio.load(res)
          $rootScope.p.play()
        )
