angular.module 'jaMusic1'
  .factory 'Main', ($http, env, Common) ->

    getFeeds = ->
      url = "#{env.url}#{env.version}/feeds/?client_id=#{env.clientId}&lang=en"
      $http.get(url)
        .then(Common.getSuccess)
        .catch(Common.getError)

    factory =
      getFeeds: getFeeds
