module PrecompilePlutoCourse
using Git, Pluto, Distributed, PackageCompiler
export start, stop, update, create_sysimage


Base.@kwdef struct Configuration
    project_module::Module = @__MODULE__
    project_path::String = pkgdir(project_module)
    sysimage_path::String = joinpath(project_path, "precompile", "$(lowercase(string(project_module))).so")
    start_notebook::String = joinpath(project_path, "index.jl")
    warmup_file::String = joinpath(project_path, "precompile", "warmup.jl")
    packages = nothing
    kwargs = NamedTuple()
end

function assert_config()
    if _CONFIG[].project_module == @__MODULE__
        error("Please configure PrecompilePlutoCourse before usage")
    end
end

const _CONFIG = Base.RefValue{Configuration}(Configuration())

function configure(project_module; kwargs...)
    _CONFIG[] = Configuration(; project_module, kwargs...)
end

function start()
    assert_config()
    exeflags = ["--project=$(_CONFIG[].project_path)"]
    sysimg = _CONFIG[].sysimage_path
    isfile(sysimg) && push!(exeflags, "--sysimage=$sysimg")
    pid = Distributed.addprocs(1, exeflags = exeflags) |> first
    expr = :(using Pluto; Pluto.run(notebook = $(_CONFIG[].start_notebook),
                                    workspace_use_distributed = false,
                                    dismiss_update_notification = true))
    @async Distributed.remotecall_eval(Main, [pid], expr)
    println("Starting a Pluto notebook in your browswer.
Please use `$(nameof(_CONFIG[].project_module)).stop()` to interrupt the Pluto notebook server.")
end

stop() = Distributed.interrupt()

function update()
    assert_config()
    @info "Performing an automatic update while keeping local changes.
    If this fails, please run manually `git pull` in the directory
    `$(_CONFIG[].project_path)`."
    current_dir = pwd()
    cd(_CONFIG[].project_path)
    if !isempty(readlines(`$(git()) diff --stat`))
        run(`$(git()) add -u`)
    end
    if !isempty(readlines(`$(git()) diff --cached`))
        run(`$(git()) -c user.name="student" -c user.email="student@mlcourse" commit -m "automatic commit of local changes"`)
    end
    run(`$(git()) pull -s recursive -X patience -X ours -X ignore-all-space --no-edit`)
    if !isempty(read(`$(git()) diff HEAD^ --name-only Manifest.toml`, String))
        Pkg.instantiate()
        PrecompilePlutoCourse.create_sysimage()
    end
    cd(current_dir)
end

function create_sysimage()
    assert_config()
    if !ispath(dirname(_CONFIG[].sysimage_path))
        error("Trying to save a sysimage in $(dirname(_CONFIG[].sysimage_path)), but this path does not exist.")
    end
    PackageCompiler.create_sysimage(_CONFIG[].packages;
                                    sysimage_path = _CONFIG[].sysimage_path,
                                    precompile_execution_file=_CONFIG[].warmup_file,
                                    project=_CONFIG[].project_path,
                                    _CONFIG[].kwargs...)
end


end # module
