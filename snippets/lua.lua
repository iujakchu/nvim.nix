return {
    s("todo", t "--TODO: "),
    s({ trig = "if", wordTrig = true }, {
        t { "if " },
        i(1),
        t { " then", "\t" },
        i(0),
        t { "", "end" },
    }),
    s({ trig = "ee", wordTrig = true }, {
        t { "else", "\t" },
        i(0),
    }),
    s("for", {
        t "for ",
        c(1, {
            sn(nil, {
                i(1, "k"),
                t ", ",
                i(2, "v"),
                t " in ",
                c(3, { t "pairs", t "ipairs", i(nil) }),
                t "(",
                i(4),
                t ")",
            }),
            sn(nil, { i(1, "i"), t " = ", i(2), t ", ", i(3) }),
        }),
        t { " do", "\t" },
        i(0),
        t { "", "end" },
    }),
    s(
        "while",
        fmt(
            [[
	while {} do
		{}
	end
	]],
            ins_generate()
        )
    ),
    s(
        "fn",
        fmt(
            [[
		local function{}({})
			{}
		end
	]],
            ins_generate()
        )
    ),
    s("doc", t "-- "),
    s(
        "req",
        fmt('local {} = require("{}")', {
            -- dl(2, l._1:match "%.([%w_]+)$", { 1 }),
            f(function(args)
                return args[1][1]:match "%.([%w_]+)$" or args[1]
            end, { 1 }),
            i(1),
        })
    ),
}
