angular.module 'jaMusic1'
  .run ($log, $rootScope, Tracks, ngAudio, $localStorage, $state, Breadcrumbs) ->
    'ngInject'
    $log.debug 'runBlock end'

    $rootScope.$storage = $localStorage.$default
      playlist: []
      trackIndex: -1
      favs: []

    $rootScope.trackIndex = -1
    $rootScope.playlist = $localStorage.playlist
    $rootScope.favs = $localStorage.favs
    $rootScope.changedTrack = false

    Breadcrumbs.resetBreadcrumbs()

    $rootScope.loadPlaylist = (list) ->
      tracks = angular.copy list
      $rootScope.playlist = tracks
      $localStorage.playlist = tracks
      $rootScope.changeTrack 0

    $rootScope.appendList = (list) ->
      tracks = angular.copy list
      for track in tracks
        $rootScope.playlist.push track
      return

    $rootScope.addToPlaylist = (track) ->
      $rootScope.playlist.push track
      return

    $rootScope.removeFromPlaylist = (e, index) ->
      e.stopPropagation()
      if index < $rootScope.trackIndex
        $rootScope.trackIndex--
        $rootScope.playlist.splice(index,1)
      else if index is $rootScope.trackIndex
        $rootScope.trackIndex--
        $rootScope.playlist.splice(index,1)
        $rootScope.nextTrack()
      else
        $rootScope.playlist.splice(index,1)
      return

    $rootScope.savePlaylist = ->
      playlist = angular.toJson($rootScope.playlist)
      data = "text/json;charset=utf-8,#{playlist}"
      a = document.createElement 'a'
      a.href = "data:#{data}"
      a.download = "playlist.json"
      a.click()

    $rootScope.loadPlaylistFile = ->
      playlist = []
      reader = new FileReader()
      input = document.createElement 'input'
      input.setAttribute 'type', 'file'
      input.setAttribute 'accept', '.json'
      input.click()

      reader.addEventListener 'load', (e) ->
        string = e.target.result
        try
          obj = angular.fromJson string
          for el in obj
            hasName = el.hasOwnProperty 'name'
            hasId = el.hasOwnProperty 'id'
            if hasName and hasId
              playlist.push el
          $rootScope.loadPlaylist playlist
        catch
          alert "Opened file isn't proper playlist file"

      input.addEventListener 'change', ->
        file = input.files[0]
        reader.readAsText file

      return

    $rootScope.changeTrack = (index) ->
      track = $rootScope.playlist[index]
      $rootScope.trackIndex = index
      $localStorage.trackIndex = index

      if $rootScope.trackId isnt track.id
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
            $rootScope.changedTrack = false
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

    $rootScope.$watch('p.progress', (a,b) ->
      if $rootScope.p and
      $rootScope.p.progress is 1 and
      $rootScope.p.duration > 0 and
      $rootScope.playlist.length and
      not $rootScope.changedTrack
        $rootScope.changedTrack = true
        $rootScope.p.stop()
        $rootScope.nextTrack()
    )

    return
