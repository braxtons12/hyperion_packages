---@diagnostic disable: undefined-global,undefined-field
package("hyperion_platform")
set_homepage("https://braxtons12.github.io/hyperion_platform/")
set_description("Platform and Architecture Detection and Feature Test Macros for C++. Part of Hyperion Engine.")
set_license("MIT")
add_urls("https://github.com/braxtons12/hyperion_platform/archive/refs/tags/v$(version).tar.gz",
         "https://github.com/braxtons12/hyperion_platform.git")
add_versions("0.1.0", "05014618e239b25230e984a88545844511a7048f")
add_versions("0.1.1", "ddf7ac8a59a7bd9a4611e109424b00de3983ef8f")
add_versions("0.1.2", "d8d4d02d39bbe0565fffd32657917f0c2eb255d6")
add_versions("0.1.3", "30bd4fc2c4191154b62a3b4cd39dd4d4362a7253")
add_versions("0.1.4", "d029acd40a6c2e94270bd10634ad53f2a37c0211")
add_versions("0.2.0", "d7e0b560b77d43d68da8fdb539dfc1594b8c0a2d")
add_versions("0.2.1", "cbb107f64b119dbb5a390703fd93ceb351b73954")
add_versions("0.2.2", "0c73e49786e74915507b2385566ba65bf1c434fd")
add_versions("0.2.3", "da23218884b1813efa625ccd86d0c6bc734ea579")

add_configs("hyperion_enable_tracy", { description = "Enable Tracy profiling", default = false, values = { false, true } })
add_configs("hyperion_enable_testing", { description = "Enable Doctest Testing Macros", default = false, values = { false, true } })

on_load(function(package)
    if package:config("hyperion_enable_tracy") then
        package:add("deps", "tracy", {
            system = false,
            external = true,
            configs = {
                languages = "cxx20"
            }
        })
    end

    if package:config("hyperion_enable_testing") then
        package:add("deps", "doctest", {
            system = false,
            external = true,
            configs = {
                languages = "cxx20"
            }
        })
    end
end)

on_install(function(package)
    local configs = {
    }
    if package:config("hyperion_enable_tracy") then
        configs.hyperion_enable_tracy = true
    end
    if package:config("hyperion_enable_testing") then
        configs.hyperion_enable_testing = true
    end
    import("package.tools.xmake").install(package, configs)
end)
