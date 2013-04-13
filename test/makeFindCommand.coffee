assert = require "assert"
utils = require "../"

query = ownerId: "6ac4f70f-fe05-4a7d-bba8-99d6fbe62261"
  
describe "makeFindCommand", ->
  it "works with a sole query object", ->
    generated = utils.makeFindCommand "nodes", query
    expected = """
    db.nodes.find({"ownerId":"6ac4f70f-fe05-4a7d-bba8-99d6fbe62261"})
    """
    assert.equal generated, expected
  it "works when options object has 'sort' field", ->
    generated = utils.makeFindCommand "nodes", query, sort: addedAt: 1
    expected = """
    db.nodes.find({"ownerId":"6ac4f70f-fe05-4a7d-bba8-99d6fbe62261"}).sort({"addedAt":1})
    """
    assert.equal generated, expected
  it "works when options object has 'fields' field", ->
    generated = utils.makeFindCommand "nodes", query,
      fields: 
        value: 1
        addedAt: 1
        changedAt: 1
    expected = """
    db.nodes.find({"ownerId":"6ac4f70f-fe05-4a7d-bba8-99d6fbe62261"},{"value":1,"addedAt":1,"changedAt":1})
    """
    assert.equal generated, expected