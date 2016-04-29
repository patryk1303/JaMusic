angular.module 'jaMusic1'
  .factory 'Tracks', ($http, env, Common, $localStorage, $q) ->
    storage = $localStorage

    getTrackFile = (id = 1204669) ->
      url = "#{env.url}#{env.version}/tracks/file/?client_id=#{env.clientId}&audioformat=mp31&id=#{id}&action=stream"

      $http.head(url)
        .then((res) ->
          # return new Audio(url)
          return url
        )
        .catch(Common.getError)

    getTrackInfo = (id = 1204669) ->
      cache = storage["track_#{id}"]

      if cache
        defer = $q.defer()
        defer.resolve cache
        return defer.promise

      url = "#{env.url}#{env.version}/tracks/?client_id=#{env.clientId}&id=#{id}"

      $http.get(url)
        .then((response) ->
          storage["track_#{id}"] = response.data
          return response.data
        )
        .catch(Common.getError)

    searchTracks = (query = '') ->
      url = "#{env.url}#{env.version}/tracks/?client_id=#{env.clientId}&namesearch=#{query}"
      $http.get(url)
        .then(Common.getSuccess)
        .catch(Common.getError)

    factory =
      getTrackFile: getTrackFile
      getTrackInfo: getTrackInfo
      searchTracks: searchTracks
