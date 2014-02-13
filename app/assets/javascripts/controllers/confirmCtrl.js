nbApp.controller( "confirmCtrl", function( $scope, $routeParams, noteService ) {

  noteService.get( $routeParams.id, function( err, data ) {
    $scope.note = data;

    var confirmChannel = PUSHERCLIENT.subscribe( "confirm" );
    confirmChannel.bind( data.address, function( data ) {
      console.log( data )

      $scope.$apply( function() {
        $scope.note.payment_valid = data.payment_valid
      } )

      Beep()
    } )
  } )

} )
