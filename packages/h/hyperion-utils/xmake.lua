package("hyperion-utils")
    set_homepage("https://braxtons12.github.io/Hyperion-Utils/")
    set_description("Collection of C++20 error handling, I/O, and logging utilities. Part of Hyperion Engine.")
    set_license("MIT")
    add_urls("https://github.com/braxtons12/Hyperion-Utils.git")

    add_configs("hyperion_tracy_enable", {description = "Enable Tracy profiling", default = false, values = {false, true}})
    add_deps("doctest", {
        system = false,
        external = true,
        configs = {
            languages = "cxx20"
        }
    })
    add_deps("fmt", {
        system = false,
        external = true,
        configs = {
            languages = "cxx20"
        }
    })
    add_deps("gsl", {
        system = false,
        external = true,
        configs = {
            languages = "cxx20"
        }
    })
    add_deps("boost", {
        system = false,
        external = true,
        configs = {
            container = true,
            exception = true,
            python = false,
            stacktrace = true,
            languages = "cxx20"
        },
    })
    add_requires("tracy", {
        system = false,
        external = true,
        configs = {
            languages = "cxx20"
        }
    })
    if not is_plat("windows") then
        add_requires("libbacktrace", {
            system = false,
            external = true,
        })
    end

    on_install(function(package)
        local configs = {}
        if package:config("hyperion_tracy_enable") then
            configs.hyperion_tracy_enable = true
        end
        import("package.tools.xmake").install(package, configs)
    end)
