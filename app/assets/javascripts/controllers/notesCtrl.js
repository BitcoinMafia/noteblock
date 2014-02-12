nbApp.controller( "notesCtrl", function( $scope, $routeParams, noteService ) {

  noteService.get( $routeParams.id, function( err, data ) {
    $scope.note = data
  } )

  // $scope.to_address = null;

  $scope.claim = function() {
    noteService.claim( $routeParams.id, $scope.to_address, $routeParams.encrypted_token, function( err, data ) {
      if ( !! err ) {
        console.log( "ERROR" );
        return;
      }

      // Message

    } )
  }

} )
