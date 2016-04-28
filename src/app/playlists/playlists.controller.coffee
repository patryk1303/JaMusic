angular.module 'jaMusic1'
  .controller 'PlaylistsController', (Playlists, Common) ->
    'ngInject'
    vm = @
    vm.loading = true

    vm.colors = Common.getColors()

    vm.searchPlaylists = ->
      vm.loading = true
      Playlists.searchPlaylists(vm.name)
        .then((res) ->
          vm.playlists = res.results
        )
        .finally(->
          vm.loading = false
        )

    Playlists.getPlaylists()
      .then((res) ->
        vm.playlists = res.results
      )
      .finally(->
        vm.loading = false
      )

    return
