angular.module 'jaMusic1'
  .factory 'Artists', (Common, env, $http) ->

    searchArtist = (query = '') ->
      url = "#{env.url}#{env.version}/artists/?client_id=#{env.clientId}&namesearch=#{query}"
      $http.get(url)
      .then(Common.getSuccess)
      .catch(Common.getError)

    getArtistTracks = (id) ->
      url = "#{env.url}#{env.version}/artists/tracks/?client_id=#{env.clientId}&id=#{id}"
      $http.get(url)
      .then(Common.getSuccess)
      .catch(Common.getError)


    factory =
      searchArtist: searchArtist
      getArtistTracks: getArtistTracks
