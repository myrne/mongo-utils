# mongo-utils

mongo-utils provides a friendly interface to MongoDB's mongodump and mongorestore commands, as well as some utility functions.

## Synchronous functions
 
```coffee
utils.parseConnectionString connectionString # mongo connection options object
utils.makeRestoreCommand connectionString, sourceDir # mongorestore ...
utils.makeDumpCommand connectionString, targetDir # mongodump ...
```

## Asynchronous functions

These functions simply wrap [`child_process.exec`](http://nodejs.org/api/child_process.html#child_process_child_process_exec_command_options_callback) in a convenient interface. There is absolutely no validation happening. Thus, the absensce of an error (as `err` argument) does not mean the dump or restore succeeded.

I advise to inspect `stdout` and `stderr` yourself if you use this module for any important dumps or restores, or verify the results otherwise.

```coffee
utils.dumpDatabase connectionString, dirName, (err, stdout, stderr) ->
utils.dumpHerokuMongoHQDatabase appName, dirName, (err, stdout, stderr) ->
utils.restoreDatabase connectionString, dirName, (err, stdout, stderr) ->
utils.dumpHerokuMongoHQDatabase appName, dirName, (err, stdout, stderr) ->
```

The heroku-mongohq functions look up the `MONGOHQ_URL` environment variable of your Heroku app, using the [heroku](https://github.com/toots/node-heroku) module.

## Prerequisites

For the commands to work, you need to have `mongorestore` and `mongodump` in your path.  
The Heroku-specific commands require a `HEROKU_API_KEY` environment variable to be set.