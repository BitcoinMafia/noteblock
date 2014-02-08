nbApp.directive( 'navbar', function() {

  return {
    restrict: "E",
    templateUrl: "/assets/components/_navbar.html",
    transclude: true
  }
} );
