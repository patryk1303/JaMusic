angular.module 'jaMusic1'
  .controller 'RadiosController', (Radios) ->
    'ngInject'
    vm = @
    vm.loading = true

    Radios.getRadios().then((res) ->
      vm.radios = res.results
    ).finally(->
      vm.loading = false
    )

    return
