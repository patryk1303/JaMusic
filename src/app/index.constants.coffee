env =
  url: 'https://api.jamendo.com/'
  clientId: '56d30c95' # 56d30c95 is for TESTING only
  version: 'v3.0'

angular.module('jaMusic1')
  .constant 'moment', moment
  .constant 'env', env
