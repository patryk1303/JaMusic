angular.module 'jaMusic1'
  .factory 'Albums', (Common, env, $http, $localStorage, $q) ->
    storage = $localStorage

    searchAlbums = (query = '') ->
      url = "#{env.url}#{env.version}/albums/?client_id=#{env.clientId}&namesearch=#{query}"
      $http.get(url)
      .then(Common.getSuccess)
      .catch(Common.getError)

    getAlbumTracks = (id) ->
      cache = storage["album_#{id}"]

      if cache and cache.results.length
        defer = $q.defer()
        defer.resolve cache
        return defer.promise

      url = "#{env.url}#{env.version}/albums/tracks/?client_id=#{env.clientId}&id=#{id}"
      $http.get(url)
      .then((res) ->
        storage["album_#{id}"] = res.data
        return res.data
      )
      .catch(Common.getError)


    factory =
      searchAlbums: searchAlbums
      getAlbumTracks: getAlbumTracks
