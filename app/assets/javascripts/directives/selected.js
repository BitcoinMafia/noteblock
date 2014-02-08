nbApp.directive( "selected", function( $timeout ) {
  return {
    link: function( $scope, element, attrs ) {
      $timeout( function() {
        $( element ).select()
      } )

      $( element ).click( function() {
        $( element ).select()
      } )
    }
  }
} )
