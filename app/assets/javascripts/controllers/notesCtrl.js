nbApp.controller( "notesCtrl", function( $scope, $routeParams, noteService ) {

  noteService.get( $routeParams.id, function( err, data ) {
    $scope.note = data
  } )

} )
