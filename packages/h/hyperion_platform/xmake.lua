---@diagnostic disable: undefined-global,undefined-field
package("hyperion_platform")
set_homepage("https://braxtons12.github.io/hyperion_platform/")
set_description("Platform and Architecture Detection and Feature Test Macros for C++. Part of Hyperion Engine.")
set_license("MIT")
add_urls("https://github.com/braxtons12/hyperion_platform.git")

add_configs("hyperion_enable_tracy", { description = "Enable Tracy profiling", default = false, values = { false, true } })
add_deps("doctest", {
    system = false,
    external = true,
    configs = {
        languages = "cxx20"
    }
})

on_install(function(package)
    local configs = {}
    if package:config("hyperion_tracy_enable") then
        configs.hyperion_enable_tracy = true
        package:add("deps", "tracy", {
            system = false,
            external = true,
            configs = {
                languages = "cxx20"
            }
        })
    end
    import("package.tools.xmake").install(package, configs)
end)
