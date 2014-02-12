nbApp.controller( "confirmCtrl", function( $scope, $routeParams, noteService ) {

  noteService.get( $routeParams.id, function( err, data ) {
    $scope.note = data;

    var confirmChannel = PUSHERCLIENT.subscribe( "confirm" );
    confirmChannel.bind( data.address, function( data ) {
      console.log( data )
      // TODO:
      // Pusher.beep()
      // change the .dim
    } )
  } )

} )
