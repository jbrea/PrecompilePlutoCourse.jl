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

If you have a course with Pluto notebooks and you would like to ship it with custom sysimages, use this package as shown in the [demo](Demo/src/Demo.jl).
The user of the `Demo` project will be able to create a custom sysimage with
```julia
using Demo
Demo.create_sysimage()
```
and use the custom sysimage with
```julia
using Demo
Demo.start()
```

See [MLCourse](https://github.com/jbrea/MLCourse) for another example.
