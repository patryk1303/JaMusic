angular.module 'jaMusic1'
  .factory 'Radios', ($http, env, Common) ->
    getRadios = ->
      url = "#{env.url}#{env.version}/radios/?client_id=#{env.clientId}"
      $http.get(url)
        .then(Common.getSuccess)
        .catch(Common.getError)

    factory =
      getRadios: getRadios
