angular.module 'jaMusic1'
  .controller 'MainController', (Main) ->
    'ngInject'
    vm = @
    vm.loading = true

    Main.getFeeds()
      .then((res) ->
        vm.feeds = res.results
      )
      .finally(->
        vm.loading = false
      )

    return
