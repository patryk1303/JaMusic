angular.module 'jaMusic1'
  .controller 'AlbumsController', (Common, Albums) ->
    vm = @
    vm.loading = true

    vm.searchAlbums = () ->
      if vm.name and vm.name.length
        vm.loading = true
        Albums.searchAlbums(vm.name)
          .then((res) ->
            vm.albums = res.results
          )
          .finally(->
            vm.loading = false
          )
    Albums.searchAlbums()
      .then((res) ->
        vm.albums = res.results
      )
      .finally(->
        vm.loading = false
      )

    return
