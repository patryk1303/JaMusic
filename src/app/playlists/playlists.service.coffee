angular.module 'jaMusic1'
  .factory 'Playlists', ($http, env, Common) ->

    getPlaylists = ->
      url = "#{env.url}#{env.version}/playlists/?client_id=#{env.clientId}"
      $http.get(url)
        .then(Common.getSuccess)
        .catch(Common.getError)

    factory =
      getPlaylists: getPlaylists
