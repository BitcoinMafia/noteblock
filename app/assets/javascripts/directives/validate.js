nbApp.directive( 'validateAddress', function() {
  return {
    require: "ngModel",
    link: function( $scope, element, attrs, ctrl ) {
      ctrl.$parsers.unshift( function( viewValue ) {
        var address = new SpareCoins.Address( viewValue )
        if ( address.validate() === true ) {
          ctrl.$setValidity( "notBase58", true )
          return viewValue
        } else {
          ctrl.$setValidity( "notBase58", false )
          return undefined
        }
      } )
    }
  }
} )
