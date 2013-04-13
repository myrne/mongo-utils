assert = require 'assert'

connString = 'mongodb://heroku:flk3ungh0x3anflx1bab@staff.mongohq.com:10092/app1321916260066'
expectedCommand = "mongodump '--db' 'app1321916260066' '--host' 'staff.mongohq.com:10092' '--username' 'heroku' '--password' 'flk3ungh0x3anflx1bab' '--out' '/dumps/mongodb/some-backup'"
dirName = '/dumps/mongodb/some-backup'
  
utils = require '../'

describe 'makeDumpCommand', ->
  it 'converts query string and dirname to a mongodump command', ->
    command = utils.makeDumpCommand connString, dirName
    assert.equal command, expectedCommand
  it 'throws an error if no dirName is given', ->
    try 
      utils.makeDumpCommand connString
    catch error
      return assert.ok true
    assert.ok false, 'it did not throw an error.'
      