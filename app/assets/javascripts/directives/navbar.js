nbApp.directive( 'navbar', function() {

  return {
    restrict: "E",
    templateUrl: "/templates/_navbar.html",
    transclude: true
  }
} );
