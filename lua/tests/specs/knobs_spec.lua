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
            "info",
            function()
                it(
                    "has correct knob count",
                    function()
                        assert.are.equal(7, knobs.count())
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
                        assert(knobs.has("test_a"))
                    end
                )
            end
        )
    end
)
