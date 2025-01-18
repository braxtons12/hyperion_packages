---@diagnostic disable: undefined-global,undefined-field
package("hyperion_assert")
set_homepage("https://braxtons12.github.io/hyperion_mpl/")
set_description("C++20 Runtime Assertions Library")
set_license("MIT")
add_urls("https://github.com/braxtons12/hyperion_assert/archive/refs/tags/v$(version).tar.gz",
    "https://github.com/braxtons12/hyperion_assert.git")
add_versions("0.1.0", "ac37fe69e1b0bcf9e8838058d7f551e20b19c8bb35ecce4b0cbc1b28e1b8fe5c")
add_versions("0.2.0", "f64acfc2a8cc071a496df1c4a2f42141d34e27498f9c6d80a9d3216ae53240a6")

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
