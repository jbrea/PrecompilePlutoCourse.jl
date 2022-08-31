module Demo

using PrecompilePlutoCourse

function __init__()
    PrecompilePlutoCourse.configure(@__MODULE__,
                                    packages = [])
end

end # module
