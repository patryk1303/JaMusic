angular.module 'jaMusic1'
  .factory 'Playlists', ($http, env) ->

    getPlaylists = ->
      url = "#{env.url}#{env.version}/playlists/?client_id=#{env.clientId}"
      console.log url

    factory =
      getPlaylists: getPlaylists
