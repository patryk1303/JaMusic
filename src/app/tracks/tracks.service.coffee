angular.module 'jaMusic1'
  .factory 'Tracks', ($http, env, Common) ->

    getTrackFile = (id = 81747) ->
      url = "#{env.url}#{env.version}/tracks/file/?client_id=#{env.clientId}&audioformat=mp31&id=#{id}"


      $http.head(url)
        .then((res) ->
          return new Audio(url)
        )
        .catch(Common.getError)

    getTrackInfo = (id = 81747) ->
      url = "#{env.url}#{env.version}/tracks/?client_id=#{env.clientId}&id=#{id}"

      $http.get(url)
        .then(Common.getSuccess)
        .catch(Common.getError)

    factory =
      getTrackFile: getTrackFile
      getTrackInfo: getTrackInfo
