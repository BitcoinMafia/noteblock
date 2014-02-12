nbApp.controller( "landingCtrl", function( $scope, $modal ) {

	$scope.NoteModal = {
		open: function() {
			$modal.open( {
				templateUrl: "/templates/_create_note.html",
				controller: createNoteCtrl,
			} )
		}
	}

	// TODO: REFACTOR
	var createNoteCtrl = function( $scope, $location, $modalInstance, noteService ) {

		$scope.note = {}

		$scope.create = function() {
			// Validate

			// Server stuff
			noteService.post( {
				email: $scope.note.email,
				content: $scope.note.content,
				sender: $scope.note.sender,
			}, function( err, data ) {
				if ( !! err ) {
					return;
				}
				$modalInstance.dismiss( 'cancel' );
				$location.path( "notes/" + data.id + "/confirm" );
			} )

		};

		$scope.cancel = function() {
			$modalInstance.dismiss( 'cancel' );
		};
	};

} );
