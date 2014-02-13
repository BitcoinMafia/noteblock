nbApp.controller( "landingCtrl", function( $scope, $modal, noteService ) {

	$scope.notes = {}
	var LIMIT = 20

	// Initial Data
	noteService.query( "latest", LIMIT, 0, function( err, data ) {
		$scope.notes.latest = data

		noteService.query( "top", LIMIT, 0, function( err, data ) {
			$scope.notes.top = data
		} )
	} )

	// Streaming Data
	var notesChannel = PUSHERCLIENT.subscribe( "notes" );
	notesChannel.bind( "latest", function( data ) {
		console.log( data )
		$scope.notes.latest.unshift( data )
	} )

	// Infinite Scrolling
	// STARTS AT
	// OFFSET: 0

	$scope.offset = {
		top: LIMIT,
		latest: LIMIT
	}

	$scope.finished = {
		top: false,
		latest: false
	}

	$scope.fetching = false

	$scope.loadMoreNotes = function( type ) {
		console.log( 'loading' )

		if ( !$scope.notes[ type ] ) {
			return;
		}
		if ( $scope.finished[ type ] ) {
			return;
		}

		if ( $scope.fetching === true ) {
			return;
		}

		// if ( $scope.notes[ type ].length ) {
		// 	return;
		// }

		$scope.fetching = true;
		noteService.query( type, LIMIT, $scope.offset[ type ], function( err, data ) {
			if ( !! err ) {
				console.log( "ERROR" )
				return;
			}

			if ( data.length > 0 ) {
				$scope.notes[ type ] = $scope.notes[ type ].concat( data );
				$scope.offset[ type ] = $scope.notes[ type ].length;
			} else {
				$scope.finished[ type ] = true;
			}

			$scope.fetching = false;
		} )

	}

	// Modal
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
