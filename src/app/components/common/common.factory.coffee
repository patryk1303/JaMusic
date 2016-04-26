angular.module 'jaMusic1'
  .factory 'Common', () ->

    getSuccess = (response) ->
      return response.data

    getError = (error) ->
      console.error error

    factory =
      getSuccess: getSuccess
      getError: getError
