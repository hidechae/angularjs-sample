gulp   = require 'gulp'
ts     = require 'gulp-typescript'
sass   = require 'gulp-sass'
jade   = require 'gulp-jade'
concat = require 'gulp-concat'

rimraf = require 'rimraf'
mkdirp = require 'mkdirp'

dist = {
  root: './dist',
  js:   './dist/js',
  css:  './dist/css',
  tpl:  './dist/tpl'
}

p = require __dirname + '/package.json'


### tasks ###

gulp.task 'default', [ 'clean', 'copy', 'ts:compile', 'sass', 'jade' ]

gulp.task 'clean', () ->
  rimraf.sync dist.root
  mkdirp.sync dist.js
  mkdirp.sync dist.css
  mkdirp.sync dist.tpl

gulp.task 'copy', () ->
  gulp.src [ './bower_components/**/*.js' ]
  .pipe gulp.dest dist.js
  gulp.src [ './bower_components/**/*.css' ]
  .pipe gulp.dest dist.css

gulp.task 'ts:compile', ->
  gulp.src [ './src/**/*.ts' ]
  .pipe ts { target: "ES5", removeComments: true, sortOutput: true }
  .pipe concat p.name + '.js'
  .pipe gulp.dest dist.js

gulp.task 'sass', ->
  gulp.src [ './sass/**/*.sass' ]
  .pipe sass()
  .pipe concat p.name + '.js'
  .pipe gulp.dest dist.css

gulp.task 'jade', ->
  gulp.src [ './src/**/*.jade' ]
  .pipe jade()
  .pipe gulp.dest dist.tpl
