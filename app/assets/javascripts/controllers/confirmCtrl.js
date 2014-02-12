nbApp.controller( "confirmCtrl", function( $scope, $routeParams, noteService ) {

  noteService.get( $routeParams.id, function( err, data ) {
    $scope.note = data;
  } )

} )
