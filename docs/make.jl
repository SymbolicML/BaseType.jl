using BaseType
using Documenter

DocMeta.setdocmeta!(BaseType, :DocTestSetup, :(using BaseType); recursive=true)

makedocs(;
    modules=[BaseType],
    authors="MilesCranmer <miles.cranmer@gmail.com> and contributors",
    repo="https://github.com/SymbolicML/BaseType.jl/blob/{commit}{path}#{line}",
    sitename="BaseType.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://symbolicml.org/BaseType.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/SymbolicML/BaseType.jl",
    devbranch="main",
)
