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

moment.fn.fromNowWithSeconds = function( a ) {
  var milliseconds = Math.abs( moment().diff( this ) );

  if ( milliseconds > 0 && milliseconds < 60000 ) { // 60 seconds
    var seconds = ( milliseconds / 1000 ).toFixed( 0 )
    return seconds + ' secs ago';
  }

  return this.fromNow( a );
}

nbApp.directive( "timeago", function( $timeout ) {
  return function( $scope, element, attrs ) {
    var epoch = attrs.timeago

    if ( epoch === "" ) {
      $( element ).text( "n/a" )
      return;
    }

    var update = function() {
      var timeago = moment( epoch, "X" ).fromNowWithSeconds()
      $( element ).text( timeago )
    }

    if ( attrs.live === 'true' ) {
      var tick = function() {
        update()
        $timeout( function() {
          tick()
        }, 1000 )
      }

      tick()
    }

  }
} )
