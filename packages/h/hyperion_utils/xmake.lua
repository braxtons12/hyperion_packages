---@diagnostic disable: undefined-global,undefined-field
package("hyperion_utils")
    set_homepage("https://braxtons12.github.io/hyperion_utils/")
    set_description("Collection of C++20 error handling, I/O, and logging utilities. Part of Hyperion Engine.")
    set_license("MIT")
    add_urls("https://github.com/braxtons12/hyperion_utils.git")

    add_configs("hyperion_enable_tracy", {description = "Enable Tracy profiling", default = false, values = {false, true}})
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
    add_deps("tracy", {
        system = false,
        external = true,
        configs = {
            languages = "cxx20"
        }
    })
    if not is_plat("windows") then
        add_deps("libbacktrace", {
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
