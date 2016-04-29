angular.module 'jaMusic1'
  .run ($log, $rootScope, Tracks, ngAudio, $localStorage) ->
    'ngInject'
    $log.debug 'runBlock end'

    $rootScope.$storage = $localStorage.$default
      playlist: []

    $rootScope.playlist = $localStorage.playlist

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
          $rootScope.trackId = track.id
          $rootScope.p = ngAudio.load(res)
          $rootScope.p.play()
        )
