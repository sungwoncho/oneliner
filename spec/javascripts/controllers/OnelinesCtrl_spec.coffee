describe 'OnelinesCtrl', ->
  scope = null
  ctrl = null
  resource = null

  httpBackend = null

  setupController = (keywords, results) ->
    inject(($rootScope, $resource, $controller) ->
      scope = $rootScope.$new()
      resource = $resource

      ctrl = $controller('OnelinesCtrl',
                          $scope: scope
                          $location: location)
      )

  beforeEach(module('oneliner'))
  beforeEach(setupController())

  it 'defaults to no onelines', ->
    expect(scope.onelines).toEqualData([])
