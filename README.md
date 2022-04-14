# PrecompilePlutoCourse.jl

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Build Status](https://travis-ci.com/jbrea/PrecompilePlutoCourse.jl.svg?branch=master)](https://travis-ci.com/jbrea/PrecompilePlutoCourse.jl)
[![codecov.io](http://codecov.io/github/jbrea/PrecompilePlutoCourse.jl/coverage.svg?branch=master)](http://codecov.io/github/jbrea/PrecompilePlutoCourse.jl?branch=master)
<!--
[![Documentation](https://img.shields.io/badge/docs-stable-blue.svg)](https://jbrea.github.io/PrecompilePlutoCourse.jl/stable)
[![Documentation](https://img.shields.io/badge/docs-master-blue.svg)](https://jbrea.github.io/PrecompilePlutoCourse.jl/dev)
-->

If you have a course with Pluto notebooks and you would like to ship it with custom sysimages, use this package as shown in the [demo](Demo/src/Demo.jl) or in [MLCourse](https://github.com/jbrea/MLCourse).
The students, who study the notebooks in the `Demo` project, will be able to create a custom sysimage with
```julia
using Demo
Demo.create_sysimage()
```
and use the custom sysimage with
```julia
using Demo
Demo.start()
```

## Usage

1. Add this package to your project
```julia
pkg> add https://github.com/jbrea/PrecompilePlutoCourse.jl#main
```

2. Create and customize a `warmup.jl` file. See [Demo/precompile/warmup.jl](Demo/precompile/warmup.jl) for a minimal example or [this customized warmup file](https://github.com/jbrea/MLCourse/blob/main/precompile/warmup.jl). The `warmup.jl` file will be passed to the `precompile_execution_file` argument of the [PackageCompiler](https://julialang.github.io/PackageCompiler.jl/stable/sysimages.html).

3. Configure `PrecompilePlutoCourse` in the `__init__()` function of your package as e.g.
   in [Demo/src/Demo.jl](Demo/src/Demo.jl).
