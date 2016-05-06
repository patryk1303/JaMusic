angular.module 'jaMusic1'
  .factory 'Artists', (Common, env, $http, $localStorage, $q) ->
    storage = $localStorage
    now = new Date().getTime()

    searchArtist = (query = '') ->
      url = "#{env.url}#{env.version}/artists/?client_id=#{env.clientId}&namesearch=#{query}"
      $http.get(url)
      .then(Common.getSuccess)
      .catch(Common.getError)

    getArtistTracks = (id) ->
      now = new Date().getTime()
      cache = storage["artist_tracks_#{id}"]

      # 86400000 ms = 24 h
      if cache and cache.results.length
        timestamp = cache.timestamp
        timeDiff = now - timestamp
        if timeDiff <= 86400000
          defer = $q.defer()
          defer.resolve cache
          return defer.promise

      url = "#{env.url}#{env.version}/artists/tracks/?client_id=#{env.clientId}&id=#{id}"
      $http.get(url)
      .then((res) ->
        res.data.timestamp = now
        storage["artist_tracks_#{id}"] = res.data
        return res.data
      )
      .catch(Common.getError)

    getArtistAlbums = (id) ->
      now = new Date().getTime()
      cache = storage["artist_albums_#{id}"]

      # 86400000 ms = 24 h
      if cache and cache.results.length
        timestamp = cache.timestamp
        timeDiff = now - timestamp
        if timeDiff <= 86400000
          defer = $q.defer()
          defer.resolve cache
          return defer.promise
      url = "#{env.url}#{env.version}/artists/albums/?client_id=#{env.clientId}&id=#{id}"
      $http.get(url)
      .then((res) ->
        res.data.timestamp = now
        storage["artist_albums_#{id}"] = res.data
        return res.data
      )
      .catch(Common.getError)


    factory =
      searchArtist: searchArtist
      getArtistTracks: getArtistTracks
      getArtistAlbums: getArtistAlbums
