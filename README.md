# mongo-utils [![Build Status](https://travis-ci.org/meryn/mongo-utils.png?branch=master)](https://travis-ci.org/meryn/mongo-utils)

[![Greenkeeper badge](https://badges.greenkeeper.io/braveg1rl/mongo-utils.svg)](https://greenkeeper.io/)

mongo-utils provides a friendly interface to MongoDB's mongodump and mongorestore commands, as well as some utility functions.

## Synchronous functions
 
```coffee
utils.parseConnectionString connectionString # mongo connection options object
utils.makeRestoreCommand connectionString, sourceDir # mongorestore ...
utils.makeDumpCommand connectionString, targetDir # mongodump ...
```

## Asynchronous functions

These functions simply wrap [`child_process.exec`](http://nodejs.org/api/child_process.html#child_process_child_process_exec_command_options_callback) in a convenient interface. There is absolutely no validation happening. Thus, the absence of an error (as `err` argument) does not mean the dump or restore succeeded.

I advise to inspect `stdout` and `stderr` yourself if you use this module for any important dumps or restores, or verify the results otherwise.

```coffee
utils.dumpDatabase connectionString, dirName, (err, stdout, stderr) ->
utils.dumpHerokuMongoHQDatabase appName, dirName, (err, stdout, stderr) ->
utils.restoreDatabase connectionString, dirName, (err, stdout, stderr) ->
utils.dumpHerokuMongoHQDatabase appName, dirName, (err, stdout, stderr) ->
```

The heroku-mongohq functions look up the `MONGOHQ_URL` environment variable of your Heroku app, using the [heroku](https://github.com/toots/node-heroku) module.

## Configuration

mongo-utils logs some messages to allow you to see what's going on behind the scenes, primarily when doing the using the dump or restore commands. To see what's being logged, you may assign a log function which takes a single `message` argument to `utils.log`. By default, `utils.log` is a noop.

```coffee
utils = require "mongo-utils"
utils.log = (msg) -> console.log msg
```

## Prerequisites

For the commands to work, you need to have `mongorestore` and `mongodump` in your path.  
The Heroku-specific commands require a `HEROKU_API_KEY` environment variable to be set.

## License

mongo-utils is released under the [MIT License](http://opensource.org/licenses/MIT).  
Copyright (c) 2013 Meryn Stol