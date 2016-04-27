angular.module 'jaMusic1'
  .controller 'RadiosController', (Radios, Common) ->
    'ngInject'
    vm = @
    vm.loading = true

    vm.colors = Common.getColors()

    Radios.getRadios().then((res) ->
      vm.radios = res.results
    ).finally(->
      vm.loading = false
    )

    return
