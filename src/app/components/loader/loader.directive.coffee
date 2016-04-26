angular.module 'jaMusic1'
  .directive 'loader', ->
    directive =
      restrict: 'EA'
      templateUrl: 'app/components/loader/loader.html'
      scope:
        loading: '='

    directive
