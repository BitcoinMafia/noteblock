/*global module:false*/
module.exports = function( grunt ) {

  // Project configuration.
  grunt.initConfig( {
    // Task configuration.
    ngtemplates: {
      nbApp: {
        htmlmin: {
          collapseWhitespace: false
        },
        options: {
          prefix: '/'
        },
        cwd: "public",
        src: '**/*.html',
        dest: 'app/assets/javascripts/cache.js'
      }
    },
    concat: {
      nbApp: {
        src: [ '**.js', '<%= ngtemplates.nbApp.dest %>' ],
        dest: 'app.js'
      }
    }
  } );

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks( 'grunt-contrib-qunit' );
  grunt.loadNpmTasks( 'grunt-contrib-jshint' );
  grunt.loadNpmTasks( 'grunt-contrib-watch' );
  grunt.loadNpmTasks( 'grunt-contrib-concat' );

  // Pre-Compile Templates
  grunt.loadNpmTasks( 'grunt-angular-templates' );

  // Default task.
  grunt.registerTask( 'default', [ 'ngtemplates' ] );

};
