using BaseType
using Documenter

DocMeta.setdocmeta!(BaseType, :DocTestSetup, :(using BaseType); recursive=true)

makedocs(;
    modules=[BaseType],
    authors="MilesCranmer <miles.cranmer@gmail.com> and contributors",
    repo="https://github.com/MilesCranmer/BaseType.jl/blob/{commit}{path}#{line}",
    sitename="BaseType.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://MilesCranmer.github.io/BaseType.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/MilesCranmer/BaseType.jl",
    devbranch="main",
)
