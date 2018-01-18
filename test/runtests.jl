using PGFPlotsX
using Base.Test
using Compat
using DataStructures: OrderedDict

const pgf = PGFPlotsX

if get(ENV, "CI", false) == true
    pgf.latexengine!(pgf.PDFLATEX)
end

@show pgf.latexengine
pgf.latexengine!(pgf.PDFLATEX)

include("test_macros.jl")

include("test_elements.jl")

cd(tempdir()) do
    include("test_build.jl")
end

# Run doc stuff
include("../docs/make.jl")
