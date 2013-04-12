{exec,spawn} = require 'child_process'

task 'build', 'Build lib from src', -> 
  exec 'mkdir -p lib', (err, stdout, stderr) ->
    throw new Error err if err
    exec "coffee --compile --output lib/ src/", (err, stdout, stderr) ->
      throw new Error err if err

task 'watch', 'Auto-build and notify', -> 
  watcher = spawn "coffee", ["--watch","--compile","--output","lib/","src/"]
  watcher.stderr.pipe(process.stderr)
  watcher.stdout.pipe(process.stdout)    