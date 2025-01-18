---@diagnostic disable: undefined-global,undefined-field
package("hyperion_std")
set_homepage("https://braxtons12.github.io/hyperion_std/")
set_description("C++20 Standard Library supplement")
set_license("MIT")
add_urls("https://github.com/braxtons12/hyperion_std/archive/refs/tags/v$(version).tar.gz",
    "https://github.com/braxtons12/hyperion_std.git")

add_configs("hyperion_enable_tracy",
    { description = "Enable Tracy profiling", default = false, values = { false, true } })

on_load(function(package)
    package:add("deps", "hyperion_platform",
        {
            system = false,
            external = true,
            configs = {
                hyperion_enable_tracy = package:config("hyperion_enable_tracy"),
                languages = "cxx20"
            },
        })
    package:add("deps", "hyperion_mpl",
        {
            system = false,
            external = true,
            configs = {
                hyperion_enable_tracy = package:config("hyperion_enable_tracy"),
                languages = "cxx20"
            },
        })
    package:add("deps", "hyperion_assert",
        {
            system = false,
            external = true,
            configs = {
                hyperion_enable_tracy = package:config("hyperion_enable_tracy"),
                languages = "cxx20"
            },
        })


    package:add("deps", "fmt", {
        system = false,
        external = true,
        configs = {
            languages = "cxx20",
        }
    })
    if not package:is_plat("windows") then
        package:add("deps", "libbacktrace", {
            system = false,
            external = true,
        })
    end

    package:add("deps", "boost 1.84", {
        system = false,
        external = true,
        configs = {
            languages = "cxx20",
            stacktrace = true,
        }
    })
    package:add("deps", "boost_ut", {
        system = false,
        external = true,
        configs = {
            languages = "cxx20",
            stacktrace = true,
        }
    })


    if package:config("hyperion_enable_tracy") then
        package:add("defines", "TRACY_ENABLE=1", { public = true })
    end
end)

on_install(function(package)
    local configs = {
    }
    if package:config("hyperion_enable_tracy") then
        configs.hyperion_enable_tracy = true
    end
    import("package.tools.xmake").install(package, configs)
end)
