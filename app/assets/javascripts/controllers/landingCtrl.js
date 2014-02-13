nbApp.controller( "landingCtrl", function( $scope, $modal ) {

	var notesChannel = PUSHERCLIENT.subscribe( "notes" );
	notesChannel.bind( "latest", function( data ) {
		console.log( data )
		// TODO:
		// Pusher.beep()
		// change the .dim
	} )

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
		$scope.form = {}

		$scope.create = function() {
			// Validate
			console.log( "Invalid Note" )
			if ( $scope.form.noteForm.$invalid || !$scope.form.noteForm.content.$modelValue ) {
				return;
			}

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
