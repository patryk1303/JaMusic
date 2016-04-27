angular.module 'jaMusic1'
  .controller 'PlaylistsController', (Playlists, Common) ->
    'ngInject'
    vm = @
    vm.loading = true

    vm.colors = Common.getColors()

    Playlists.getPlaylists()
      .then((res) ->
        vm.playlists = res.results
      )
      .finally(->
        vm.loading = false
      )

    return
