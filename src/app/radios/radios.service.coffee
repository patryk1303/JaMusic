angular.module 'jaMusic1'
  .factory 'Radios', ($http, env) ->
    getRadios = ->
      url = "#{env.url}#{env.version}/radios/?client_id=#{env.clientId}"
      console.log url

    factory =
      getRadios: getRadios
