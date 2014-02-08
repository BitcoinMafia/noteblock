nbApp.controller( "landingCtrl", function( $scope, $modal ) {

	$scope.Note = {
		create: function() {
			$modal.open( {
				templateUrl: "/templates/_create_note.html",
				controller: createNoteCtrl,
			} )
		}
	}

	var createNoteCtrl = function( $scope, $location, $modalInstance ) {

		$scope.create = function() {
			// Validate
			// Server stuff
			// Redirect on callback to confirm with queries
			$modalInstance.dismiss( 'cancel' );
			$location.path( "/confirm" ).search( {
				address: "16ps38WzmDhEWMPQecVndrWZADekC4FU42"
			} )
		};

		$scope.cancel = function() {
			$modalInstance.dismiss( 'cancel' );
		};
	};

} );
