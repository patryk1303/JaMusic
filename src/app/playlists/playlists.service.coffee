angular.module 'jaMusic1'
  .factory 'Playlists', ($http, env, Common) ->

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
      url = "#{env.url}#{env.version}/playlists/tracks/?client_id=#{env.clientId}&id=#{id}"
      $http.get(url)
        .then(Common.getSuccess)
        .catch(Common.getError)

    factory =
      getPlaylists: getPlaylists
      searchPlaylists: searchPlaylists
      getPlaylist: getPlaylist
