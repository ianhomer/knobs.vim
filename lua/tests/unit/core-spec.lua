describe(
    "knobs",
    function()
        setup(
            function()
                _G.vim = {
                    cmd = function()
                    end,
                    g = {
                        knobs_levels = {}
                    }
                }
                knobs = require("knobs")
                function mockUse(args)
                    return args
                end
                function setKnob(knob, on)
                    vim.g["knob_" .. knob] = on and 1 or nil
                    vim.g["knobs_levels"][knob] = on and 1 or 0
                end
            end
        )

        describe(
            "from package name",
            function()
                it(
                    "when nvim after",
                    function()
                        assert.are.equal(knobs.fromPackage("x/x.nvim"), "x")
                    end
                )
                it(
                    "when vim after",
                    function()
                        assert.are.equal(knobs.fromPackage("x/x.vim"), "x")
                    end
                )
                it(
                    "when nvim before",
                    function()
                        assert.are.equal(knobs.fromPackage("x/nvim-x"), "x")
                    end
                )
                it(
                    "when vim before",
                    function()
                        assert.are.equal(knobs.fromPackage("x/vim-x"), "x")
                    end
                )
            end
        )

        describe(
            "use",
            function()
                it(
                    "when no knobs set",
                    function()
                        local use = knobs.use(mockUse)
                        assert.are.same(use({"no-knob"}), {"no-knob"})
                    end
                )
                it(
                    "when knob set",
                    function()
                        local use = knobs.use(mockUse)
                        setKnob("thing", true)
                        assert.are.same(use({"x/thing.nvim"}), {"x/thing.nvim", cond = 'vim.g["knob_thing"] ~= nil'})
                    end
                )
                it(
                    "locks when knob off",
                    function()
                        local use = knobs.use(mockUse)
                        setKnob("thing", false)
                        assert.are.same(
                            use({"x/thing.nvim"}),
                            {"x/thing.nvim", cond = 'vim.g["knob_thing"] ~= nil', lock = true}
                        )
                    end
                )
            end
        )
    end
)
