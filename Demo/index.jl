### A Pluto.jl notebook ###
# v0.19.11

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 4af0641e-cc9e-4a09-ba69-431ab79be705
using Pkg; Pkg.activate(@__DIR__); using Distributions, PlutoPlotly, PlutoUI

# ╔═╡ 167ea84e-ba44-11ec-28b8-a772d1a245b9
md"Hi. This is the index page of a demo project that uses `PrecompilePlutoCourse`.

To create a custom system image and start this page with the custom image run
```julia
using Demo
Demo.create_sysimage()
Demo.start()
```

Below is some random content; just to make this notebook look less empty.
"

# ╔═╡ 353a874b-5950-40f0-b41b-d6346d3fbd27
md"mean = $(@bind mu Slider(-4:.1:4, default = 0, show_value = true))

std = $(@bind s Slider(.1:.1:4, default = 1, show_value = true))"

# ╔═╡ ddfd5f88-c867-4a4b-b4be-de2a0fd8c82e
let
	p = scatter(x = -10:.01:10, y = pdf.(Normal(mu, s), -10:.01:10), mode = "lines")
	PlutoPlot(Plot(p, Layout(uirevision = 1)))
end

# ╔═╡ 8c1ff12b-66ff-4938-b374-e2235625dae1


# ╔═╡ Cell order:
# ╠═4af0641e-cc9e-4a09-ba69-431ab79be705
# ╟─167ea84e-ba44-11ec-28b8-a772d1a245b9
# ╟─353a874b-5950-40f0-b41b-d6346d3fbd27
# ╟─ddfd5f88-c867-4a4b-b4be-de2a0fd8c82e
# ╠═8c1ff12b-66ff-4938-b374-e2235625dae1
