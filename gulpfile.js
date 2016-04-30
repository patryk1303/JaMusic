/**
 *  Welcome to your gulpfile!
 *  The gulp tasks are split into several files in the gulp directory
 *  because putting it all here was too long
 */

'use strict';

var gulp = require('gulp');
var electron = require('gulp-electron');
var wrench = require('wrench');

/**
 *  This will load all js or coffee files in the gulp directory
 *  in order to load all gulp tasks
 */
wrench.readdirSyncRecursive('./gulp').filter(function(file) {
  return (/\.(js|coffee)$/i).test(file);
}).map(function(file) {
  require('./gulp/' + file);
});


/**
 *  Creates application executable
 */
 gulp.task('electron', function() {
	 var packageJson = require('./package.json');
	 
	 gulp.src('')
	 .pipe(electron({
		 src: './dist',
		 packageJson: packageJson,
		 release: './release',
		 cache: './.tmp/cache',
		 version: 'v0.37.4',
		 packaging: true,
		 platforms: ['win32-ia32'],
		 platformResources: {
			 win: {
				"version-string": packageJson.version,
                "file-version": packageJson.version,
                "product-version": packageJson.version,
                "icon": 'gulp-electron.ico'
			 }
		 }
	 }))
	 .pipe(gulp.dest(''));
 });

/**
 *  Default task clean temporaries directories and launch the
 *  main optimization build task
 */
gulp.task('default', ['clean'], function () {
  gulp.start('build');
});
