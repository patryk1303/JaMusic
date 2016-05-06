angular.module 'jaMusic1'
  .factory 'Playlists', ($http, env, Common, $localStorage, $q) ->
    storage = $localStorage
    now = new Date().getTime()

    getPlaylists = ->
      url = "#{env.url}#{env.version}/playlists/?client_id=#{env.clientId}"
      $http.get(url)
        .then(Common.getSuccess)
        .catch(Common.getError)

    searchPlaylists = (query) ->
      url = "#{env.url}#{env.version}/playlists/?client_id=#{env.clientId}&namesearch=#{query}"
      $http.get(url)
        .then(Common.getSuccess)
        .catch(Common.getError)

    getPlaylist = (id) ->
      now = new Date().getTime()
      cache = storage["playlist_#{id}"]

      # 86400000 ms = 24 h
      if cache and cache.results.length
        timestamp = cache.timestamp
        timeDiff = now - timestamp
        if timeDiff <= 86400000
          defer = $q.defer()
          defer.resolve cache
          return defer.promise
      url = "#{env.url}#{env.version}/playlists/tracks/?client_id=#{env.clientId}&id=#{id}"
      $http.get(url)
      .then((res) ->
        res.data.timestamp = now
        storage["playlist_#{id}"] = res.data
        return res.data
      )
      .catch(Common.getError)

    factory =
      getPlaylists: getPlaylists
      searchPlaylists: searchPlaylists
      getPlaylist: getPlaylist
