angular.module 'jaMusic1'
  .factory 'Albums', (Common, env, $http) ->

    searchAlbums = (query = '') ->
      url = "#{env.url}#{env.version}/albums/?client_id=#{env.clientId}&namesearch=#{query}"
      $http.get(url)
      .then(Common.getSuccess)
      .catch(Common.getError)

    getAlbumTracks = (id) ->
      url = "#{env.url}#{env.version}/albums/tracks/?client_id=#{env.clientId}&id=#{id}"
      $http.get(url)
      .then(Common.getSuccess)
      .catch(Common.getError)


    factory =
      searchAlbums: searchAlbums
      getAlbumTracks: getAlbumTracks
