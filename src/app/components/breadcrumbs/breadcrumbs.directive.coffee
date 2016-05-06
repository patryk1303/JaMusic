angular.module 'jaMusic1'
  .directive 'breadcrumbs', ($state, Breadcrumbs) ->
    link = (scope, el, attr, controller) ->
      scope.getStateName = (breadcrumb, index, last) ->
        if not last
          obj = {}

          if breadcrumb.idName and breadcrumb.id
            obj[breadcrumb.idName] = breadcrumb.id

          Breadcrumbs.cutBreadcrumbsFromIndex index

          $state.go breadcrumb.state, obj
      return

    directive =
      restrict: 'EA'
      templateUrl: 'app/components/breadcrumbs/breadcrumbs.html'
      replace: yes
      scope:
        breadcrumbs: '=crumbs'
      link: link

    directive
