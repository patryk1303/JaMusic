angular.module 'jaMusic1'
  .directive 'navbar', ->

    directive =
      restrict: 'E'
      templateUrl: 'app/components/navbar/navbar.html'
      scope: state: '='
