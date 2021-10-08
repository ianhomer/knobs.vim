vim = {
  cmd = function() end
}

knobs = require("knobs")

describe("knobs", function()
  describe("should conditional use", function()
    it("should use", function()
      assert.truthy(knobs)
      assert.truthy("OK")
    end)
  end)
end)
