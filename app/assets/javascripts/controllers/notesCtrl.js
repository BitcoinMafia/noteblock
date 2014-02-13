nbApp.controller( "notesCtrl", function( $scope, $routeParams, noteService ) {

  noteService.get( $routeParams.id, function( err, data ) {
    $scope.note = data
  } )

  $scope.claimErrors = {
    encrypted_token: false,
    withdraw: false,
    address: false
  }

  $scope.claimSuccess = false
  $scope.claiming = false

  $scope.claim = function() {
    $scope.claiming = true

    if ( !$routeParams.encrypted_token ) {
      $scope.claimErrors.encrypted_token = true;
      return;
    }

    if ( $scope.claimForm.$invalid ) {
      console.log( "CLAIM FORM INVALID" )
      $scope.claimErrors.address = true;
      return;
    }

    noteService.claim( $routeParams.id, $scope.to_address, $routeParams.encrypted_token, function( err, data ) {
      if ( !! err ) {
        console.log( "ERROR" );
        $scope.claimErrors.withdraw = true;
        $scope.claiming = false;
        return;
      }

      $scope.claimSuccess = true
      return;

    } )
  }

} )
