vim = {
  cmd = function() end
}

knobs = require("knobs")

describe("knobs", function()
  describe("for package name", function()
    it("nvim after", function()
      assert.are.equal(knobs.fromPackage("x/x.nvim"),"x")
    end)
    it("vim after", function()
      assert.are.equal(knobs.fromPackage("x/x.vim"),"x")
    end)
    it("nvim before", function()
      assert.are.equal(knobs.fromPackage("x/nvim-x"),"x")
    end)
    it("vim before", function()
      assert.are.equal(knobs.fromPackage("x/vim-x"),"x")
    end)
  end)
end)
