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
                function setKnob(knob)
                    vim.g["knob_" .. knob] = 1
                    vim.g["knobs_levels"][knob] = 1
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
                        setKnob("thing")
                        assert.are.same(use({"x/thing.nvim"}), {"x/thing.nvim", cond = 'vim.g["knob_thing"]'})
                    end
                )
            end
        )
    end
)
