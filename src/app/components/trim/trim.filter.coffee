angular.module 'jaMusic1'
  .filter 'trim', ->
    filterFn = (input) ->
      console.log input
      if(angular.isString input)
        return input.trim()
      input

    filterFn
