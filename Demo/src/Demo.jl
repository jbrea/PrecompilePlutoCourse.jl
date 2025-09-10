module Demo

using PrecompilePlutoCourse

function __init__()
    PrecompilePlutoCourse.configure(@__MODULE__, project_path = joinpath(@__DIR__, ".."))
end

end # module
