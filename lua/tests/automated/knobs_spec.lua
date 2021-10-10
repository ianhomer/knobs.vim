local knobs = require("knobs")

describe("knobs", function()
  describe("sanity", function()
    it("", function()
      assert(true)
    end)

    it("has k1a", function()
      assert(knobs.has("k1a"))
    end)

    it("does not have k5b", function()
      assert(knobs.has("k1a"))
    end)
  end)
end)
