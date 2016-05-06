angular.module 'jaMusic1'
  .factory 'Breadcrumbs', ($rootScope) ->

    breadcrumbs = [
      {
        name: 'Home'
        state: 'home'
      }
    ]

    resetBreadcrumbs = ->
      breadcrumbs = [
        {
          name: 'Home'
          state: 'home'
        }
      ]

    getBreadcrumbs = ->
      breadcrumbs

    pushBreadcrumb = (breadcrumb) ->
      breadcrumbs.push(breadcrumb)

    popBreadcrumb = ->
      breadcrumbs.pop()

    cutBreadcrumbsFromIndex = (index) ->
      breadcrumbs.splice index, breadcrumbs.length
      $rootScope.breadcrumbs = breadcrumbs

    factory =
      resetBreadcrumbs: resetBreadcrumbs
      getBreadcrumbs: getBreadcrumbs
      pushBreadcrumb: pushBreadcrumb
      popBreadcrumb: popBreadcrumb
      cutBreadcrumbsFromIndex: cutBreadcrumbsFromIndex

    factory
