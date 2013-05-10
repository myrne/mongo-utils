assert = require "assert"

getConnectionInfo = require("../").getConnectionInfo

describe "getConnectionInfo", ->
  it "makes port default to 27017", ->
    parsed = getConnectionInfo("somedb")
    assert.equal parsed.port, 27017
  it "makes protocol default to mongodb", ->
    parsed = getConnectionInfo("somedb")
    assert.equal parsed.protocol, "mongodb"
  it "makes hostname default to localhost", ->
    parsed = getConnectionInfo("somedb")
    assert.equal parsed.hostname, "localhost"    
  it "gives host as [hostname]:[port]", ->
    parsed = getConnectionInfo("somedb")
    assert.equal parsed.host, "localhost:27017"
    