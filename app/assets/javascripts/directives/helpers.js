var SATOSHI = 100000000

nbApp.directive( "toBtc", function() {
  return function( $scope, element, attrs ) {

    $scope.$watch( "note", function() {
      var satoshiStr = attrs.toBtc
      if ( satoshiStr === "" ) {
        return
      };

      var satoshis = parseInt( satoshiStr )
      var btc = ( satoshis / SATOSHI ).toFixed( 8 )
      var btc = btc.replace( /\.?0+$/, "" )

      $( element ).text( btc + " BTC" )
    } )
  }
} )

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
