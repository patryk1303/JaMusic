angular.module 'jaMusic1'
  .run ($log, $rootScope, Tracks, ngAudio, $localStorage) ->
    'ngInject'
    $log.debug 'runBlock end'

    $rootScope.$storage = $localStorage.$default
      playlist: []

    $rootScope.playlist = $localStorage.playlist

    $rootScope.addToPlaylist = (track) ->
      $rootScope.playlist.push track

    $rootScope.removeFromPlaylist = (e, index) ->
      e.stopPropagation()
      $rootScope.playlist.splice(index,1)

    $rootScope.savePlaylist = ->
      playlist = angular.toJson($rootScope.playlist)
      data = "text/json;charset=utf-8,#{playlist}"
      a = document.createElement 'a'
      a.href = "data:#{data}"
      a.download = "playlist.json"
      a.click()

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
