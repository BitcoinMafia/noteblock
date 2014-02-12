nbApp.controller( "landingCtrl", function( $scope, $modal, $resource ) {

	$scope.NoteModal = {
		open: function() {
			$modal.open( {
				templateUrl: "/templates/_create_note.html",
				controller: createNoteCtrl,
			} )
		}
	}

	var createNoteCtrl = function( $scope, $location, $modalInstance ) {

		var Note = $resource( "/notes/:note_id" )

		$scope.note = {}

		$scope.create = function() {
			// Validate

			debugger

			// Server stuff
			Note.save( {
				email: $scope.note.email,
				content: $scope.note.content,
				sender: $scope.note.sender,
			}, function( response ) {
				$modalInstance.dismiss( 'cancel' );
				$location.path( "notes/" + response.note_id + "/confirm" )

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
