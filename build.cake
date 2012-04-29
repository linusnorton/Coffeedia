
fs = require 'fs'

{print} = require 'sys'
{spawn} = require 'child_process'

# supervisor -w build/ build/app.js
run = (callback) ->
  coffee = spawn 'supervisor', ['-w', 'build', 'build/app.js']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

# rm -R build
# coffee -c -o build src
# ln -s ../../../src/public/script/vendor build/public/script/vendor
# ln -s ../../../src/view build/view
# ln -s ../../src/public/css build/public/css
build = (callback) ->
  coffee = spawn 'rm', ['-R', 'build']
  coffee = spawn 'coffee', ['-c', '-o', 'build', 'src']
  coffee = spawn 'ln', ['-s', '../../../src/public/script/vendor', 'build/public/script/vendor']
  coffee = spawn 'ln', ['-s', '../../../src/view', 'build/view']
  coffee = spawn 'ln', ['-s', '../../src/public/css', 'build/public/css']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

# coffee --watch --compile --output build/ src/
watch = (callback) ->
  coffee = spawn 'coffee', ['-w', '-c', '-o', 'build', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

task 'watch', 'Build build/ from src/', ->
  watch()