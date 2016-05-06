angular.module 'jaMusic1'
  .directive 'breadcrumbs', () ->
    link = (scope, el, attr, controller) ->
      console.log scope
      return

    directive =
      restrict: 'EA'
      templateUrl: 'app/components/breadcrumbs/breadcrumbs.html'
      replace: yes
      scope:
        breadcrumbs: '=crumbs'
      link: link

    directive
