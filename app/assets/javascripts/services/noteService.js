nbApp.factory( "noteService", function( $resource ) {
  var NoteAPI = $resource( "/api/notes/:id" )
  var NoteAPIClaim = $resource( "/api/notes/:id/claim" )

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
    query: function( type, limit, offset, callback ) {
      NoteAPI.query( {
        id: type,
        limit: limit || 20,
        offset: offset || 0
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
    },
    claim: function( id, to_address, encrypted_token, callback ) {
      NoteAPIClaim.get( {
        id: id,
        to_address: to_address,
        encrypted_token: encrypted_token
      }, function( data ) {
        callback( null, data )
      }, function( err ) {
        console.log( "ERROR" )
        callback( err, null )
      } )
    },
  }
} )
