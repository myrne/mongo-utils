mongo-utils: Utilities for managing MongoDB databases
=====================================================

Asynchronous
------------

```coffee
utils.dumpDatabase connectionString, dirName, (err) ->
utils.dumpHerokuMongoHQDatabase appName, dirName, (err) ->
utils.restoreDatabase connectionString, dirName, (err) ->
utils.dumpHerokuMongoHQDatabase appName, dirName, (err) ->
```

Synchronous
-----------

```coffee
utils.parseConnectionString connectionString
```

Prerequisites
-------------

You need to have mongorestore and mongodump in your path.
The Heroku specific functions require a ```HEROKU_API_KEY``` environment variable to be set.