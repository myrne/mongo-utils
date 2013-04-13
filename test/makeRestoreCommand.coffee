assert = require "assert"
path = require "path"

fixturesDir = path.resolve __dirname, "fixtures"

connString = "mongodb://heroku:flk3ungh0x3anflx1bab@staff.mongohq.com:10092/app1321916260066"
expectedCommand = "mongorestore '--db' 'app1321916260066' '--host' 'staff.mongohq.com:10092' '--username' 'heroku' '--password' 'flk3ungh0x3anflx1bab' '--drop' '#{fixturesDir}/fake-dump-dir/databasename'"

utils = require "../"

describe "makeRestoreCommand", ->
  it "converts query string and dirname to a mongorestore command", ->
    dirName = "#{fixturesDir}/fake-dump-dir"
    command = utils.makeRestoreCommand connString, dirName
    assert.equal command, expectedCommand
  it "throws an error if source directory does not exist", ->
    dirName = "#{fixturesDir}/not-existing"
    try 
      utils.makeDumpCommand connString
    catch error
      return assert.ok true
    assert.ok false, "it did not throw an error."
  it "throws an error if source directory contains more than subdirectory", ->
    dirName = "#{fixturesDir}/invalid-dump-dir"
    try 
      utils.makeDumpCommand connString
    catch error
      return assert.ok true
    assert.ok false, "it did not throw an error."
  it "throws an error if no dirName is given", ->
    try 
      utils.makeDumpCommand connString
    catch error
      return assert.ok true
    assert.ok false, "it did not throw an error."
      