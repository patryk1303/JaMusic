angular.module 'jaMusic1'
  .controller 'RadiosController', (Radios) ->
    'ngInject'
    vm = this

    Radios.getRadios()
