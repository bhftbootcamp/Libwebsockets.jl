using Libwebsockets
using Documenter

DocMeta.setdocmeta!(Libwebsockets, :DocTestSetup, :(using Libwebsockets); recursive = true)

makedocs(;
    modules = [Libwebsockets],
    sitename = "Libwebsockets.jl",
    format = Documenter.HTML(;
        repolink = "https://github.com/bhftbootcamp/Libwebsockets.jl",
        canonical = "https://bhftbootcamp.github.io/Libwebsockets.jl",
        edit_link = "master",
        assets = ["assets/favicon.ico"],
        sidebar_sitename = true,  # Set to 'false' if the package logo already contain its name
    ),
    pages = [
        "Home"    => "index.md",
        "Manual" => "pages/manual.md",
        # Add your pages here ...
    ],
    warnonly = [:doctest, :missing_docs],
)

deploydocs(;
    repo = "github.com/bhftbootcamp/Libwebsockets.jl",
    devbranch = "master",
    push_preview = true,
)
