child_process = require 'child_process'
hound = require 'hound'

build = (after) ->
    console.log "build"
    coffeeOpts = ['-c', '-b', '-o', "lib", "src"]
    coffee = child_process.spawn './node_modules/.bin/coffee', coffeeOpts
    coffee.stdout.pipe process.stdout
    coffee.stderr.pipe process.stderr
    after()

runSpec = (fileOrFolder) ->
  test_runner = child_process.spawn './node_modules/.bin/mocha', [
    '--colors','--compilers', 'coffee:coffee-script', fileOrFolder
  ]
  test_runner.stdout.pipe process.stdout
  test_runner.stderr.pipe process.stderr

specOrSrc = (file) ->
  console.log file
  match = file.match /(src|spec)\/(.+)(_spec)?.coffee/
  if match[1] == 'src'
    #
    # changed src/ file
    #
    build ->
      specFile = 'spec/' + match[2] + '_spec.coffee'
      runSpec specFile
  else
    runSpec file

watchSrcDir = ->
  watcher = hound.watch './src'
  watcher.on 'change', (file, stats) ->
    specOrSrc file

watchSpecDir = ->
  watcher = hound.watch './spec'
  watcher.on 'change', (file, stats) ->
    specOrSrc file

task 'dev', "Continuous test code changes", ->
  watchSpecDir()
  watchSrcDir()

task 'spec', "Run all tests", ->
  runSpec 'spec'
