nbApp.controller( "landingCtrl", function( $scope, $modal, $resource ) {

	$scope.Note = {
		create: function() {
			$modal.open( {
				templateUrl: "/templates/_create_note.html",
				controller: createNoteCtrl,
			} )
		}
	}

	var createNoteCtrl = function( $scope, $location, $modalInstance ) {

		var Note = $resource( "/notes/:note_id" )

		$scope.create = function() {
			// Validate

			// Server stuff
			Note.save( {
				email: "asdf",
			}, function( response ) {
				debugger
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
