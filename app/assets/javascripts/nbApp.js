'use strict';

var nbApp = angular.module( 'nbApp', [
	'ngRoute',
	'ngResource',
	'ui.bootstrap'
] )

nbApp.config( function( $locationProvider ) {
	$locationProvider.html5Mode( true );
} )

nbApp.run( function( $rootScope, $location, $anchorScroll ) {
	$rootScope.global = {}

	$rootScope.global.isOnLink = function( path ) {
		return path === $location.path().split( "/" )[ 1 ];
	}

	$rootScope.$on( '$routeChangeSuccess', function( next, current ) {
		$anchorScroll();
	} );
} )

nbApp.config( function( $routeProvider ) {

	$routeProvider.when( "/", {
		controller: "landingCtrl",
		templateUrl: "/templates/landing.html"
	} )

	$routeProvider.when( "/notes/:id", {
		controller: "notesCtrl",
		templateUrl: "/templates/notes.html"
	} )

	$routeProvider.when( "/confirm", {
		controller: "confirmCtrl",
		templateUrl: "/templates/confirm.html"
	} )

	$routeProvider.otherwise( {
		templateUrl: '/404.html'
	} );

} )
