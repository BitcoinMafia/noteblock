nbApp.controller( "landingCtrl", function( $scope, $modal, $resource ) {

	$scope.NoteModal = {
		open: function() {
			$modal.open( {
				templateUrl: "/templates/_create_note.html",
				controller: createNoteCtrl,
			} )
		}
	}

	// TODO
	// REFACTOR INTO noteService
	var createNoteCtrl = function( $scope, $location, $modalInstance ) {

		var Note = $resource( "/notes/:id" )

		$scope.note = {}

		$scope.create = function() {
			// Validate

			// Server stuff
			Note.save( {
				email: $scope.note.email,
				content: $scope.note.content,
				sender: $scope.note.sender,
			}, function( response ) {
				$modalInstance.dismiss( 'cancel' );
				$location.path( "notes/" + response.id + "/confirm" )

			}, function( data ) {
				// TODO: Handle error!
				console.log( 'ERROR', data )
			} )

		};

		$scope.cancel = function() {
			$modalInstance.dismiss( 'cancel' );
		};
	};

} );
