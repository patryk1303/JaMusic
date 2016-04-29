angular.module 'jaMusic1'
  .run ($log, $rootScope, Tracks, ngAudio, $localStorage) ->
    'ngInject'
    $log.debug 'runBlock end'

    $rootScope.$storage = $localStorage.$default
      playlist: []
      trackIndex: -1

    $rootScope.playlist = $localStorage.playlist
    $rootScope.trackIndex = $localStorage.trackIndex

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

    $rootScope.changeTrack = (index) ->
      track = $rootScope.playlist[index]
      $rootScope.trackIndex = index
      $localStorage.trackIndex = index
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

    $rootScope.nextTrack = ->
      index = $rootScope.trackIndex + 1
      if index >= $rootScope.playlist.length
        index = 0
      $rootScope.changeTrack index

    $rootScope.previousTrack = ->
      index = $rootScope.trackIndex - 1
      if index < 0
        index = $rootScope.playlist.length - 1
      $rootScope.changeTrack index

    return
