angular.module 'jaMusic1'
  .factory 'Common', () ->

    getSuccess = (response) ->
      return response.data

    getError = (error) ->
      console.error error

    getColors = ->
      [
        '#3F51B5',
        '#FF7043',
        '#512DA8',
        '#795548',
        '#ef5350',
        '#1976D2',
        '#689F38',
        '#D4E157',
        '#E040FB',
        '#303F9F',
        '#F06292',
        '#F4511E'
      ]

    factory =
      getSuccess: getSuccess
      getError: getError
      getColors: getColors
