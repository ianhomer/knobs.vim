local knobs = require("knobs")

function mockUse(args)
    return args
end

describe(
    "knobs",
    function()
        describe(
            "sanity",
            function()
                it(
                    "has k1a",
                    function()
                        assert(knobs.has("k1a"))
                    end
                )

                it(
                    "does not have k5b",
                    function()
                        assert(not knobs.has("k5b"))
                    end
                )
            end
        )

        describe(
            "env",
            function()
                it(
                    "rtp",
                    function()
                        -- assert.are.equal("x", vim.o.runtimepath)
                    end
                )
            end
        )

        describe(
            "layer",
            function()
                it(
                    "has test_a",
                    function()
                        -- assert.are.equal(1, vim.g["knobs_layers"])
                        -- -- -- -- -- -- -- -- -- assert.are.equal(1, vim.g["knobs_layers_map"])
                        -- assert.are.equal(1, knobs.asString())
                        assert(knobs.has("test_a"))
                    end
                )
            end
        )
    end
)
