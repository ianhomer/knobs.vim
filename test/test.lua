vim = {
  cmd = function() end
}

knobs = require("knobs")

describe("knobs", function()
  describe("from package name", function()
    it("when nvim after", function()
      assert.are.equal(knobs.fromPackage("x/x.nvim"),"x")
    end)
    it("when vim after", function()
      assert.are.equal(knobs.fromPackage("x/x.vim"),"x")
    end)
    it("when nvim before", function()
      assert.are.equal(knobs.fromPackage("x/nvim-x"),"x")
    end)
    it("when vim before", function()
      assert.are.equal(knobs.fromPackage("x/vim-x"),"x")
    end)
  end)
end)
