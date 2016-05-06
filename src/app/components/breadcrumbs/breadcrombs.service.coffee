angular.module 'jaMusic1'
  .factory 'Breadcrumbs', () ->

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

    factory =
      resetBreadcrumbs: resetBreadcrumbs
      getBreadcrumbs: getBreadcrumbs
      pushBreadcrumb: pushBreadcrumb
      popBreadcrumb: popBreadcrumb

    factory
