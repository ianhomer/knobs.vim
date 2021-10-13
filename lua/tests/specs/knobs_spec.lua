local knobs = require("knobs")

function mockUse(args)
  return args
end

describe("knobs", function()
  describe("sanity", function()
    it("has k1a", function()
      assert(knobs.has("k1a"))
    end)

    it("does not have k5b", function()
      assert(not knobs.has("k5b"))
    end)
  end)

end)
