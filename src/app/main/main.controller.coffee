angular.module 'jaMusic1'
  .controller 'MainController', ($rootScope, Main, Tracks) ->
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
