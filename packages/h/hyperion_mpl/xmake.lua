---@diagnostic disable: undefined-global,undefined-field
package("hyperion_mpl")
set_homepage("https://braxtons12.github.io/hyperion_mpl/")
set_description("C++20 Value-oriented Metaprogramming Library")
set_license("MIT")
add_urls("https://github.com/braxtons12/hyperion_mpl/archive/refs/tags/v$(version).tar.gz",
         "https://github.com/braxtons12/hyperion_mpl.git")

add_repositories("hyperion https://github.com/braxtons12/hyperion_packages.git")

add_configs("hyperion_enable_tracy",
    { description = "Enable Tracy profiling", default = false, values = { false, true } })

add_deps("doctest", {
    system = false,
    external = true,
    configs = {
        languages = "cxx20"
    }
})

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
end)

on_install(function(package)
    local configs = {
    }
    if package:config("hyperion_enable_tracy") then
        configs.hyperion_enable_tracy = true
    end
    import("package.tools.xmake").install(package, configs)
end)
