nbApp.factory( "noteService", function( $resource ) {
  var NoteAPI = $resource( "/api/notes/:id" )

  return {
    get: function( id, callback ) {
      NoteAPI.get( {
        id: id
      }, function( data ) {
        callback( null, data )
      }, function( err ) {
        console.log( "ERROR" )
        callback( err, null )
      } )
    },
    post: function( body, callback ) {
      NoteAPI.save( body, function( data ) {
        callback( null, data )
      }, function( err ) {
        console.log( "ERR" )
        callback( err, null )
      } )
    }
  }
} )
