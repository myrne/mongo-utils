utils = require '../lib/utils'

query = ownerId: "6ac4f70f-fe05-4a7d-bba8-99d6fbe62261"
queryOptions = 
tests = 
  "Sole query": ->
    generated = utils.makeFindCommand "nodes", query
    expected = """
    db.nodes.find({"ownerId":"6ac4f70f-fe05-4a7d-bba8-99d6fbe62261"})
    """
    generated is expected
  "With sort": ->
    generated = utils.makeFindCommand "nodes", query, sort: addedAt: 1
    expected = """
    db.nodes.find({"ownerId":"6ac4f70f-fe05-4a7d-bba8-99d6fbe62261"}).sort({"addedAt":1})
    """
    generated is expected
  "With fields": ->
    generated = utils.makeFindCommand "nodes", query,
      fields: 
        value: 1
        addedAt: 1
        changedAt: 1
    expected = """
    db.nodes.find({"ownerId":"6ac4f70f-fe05-4a7d-bba8-99d6fbe62261"},{"value":1,"addedAt":1,"changedAt":1})
    """
    generated is expected

console.log name + ": " + tester() for name, tester of tests
throw "Test '#{name}' failed." for name, tester of tests when not tester()
console.log "All tests passed."