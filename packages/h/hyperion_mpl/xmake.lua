---@diagnostic disable: undefined-global,undefined-field
package("hyperion_mpl")
set_homepage("https://braxtons12.github.io/hyperion_mpl/")
set_description("C++20 Value-oriented Metaprogramming Library")
set_license("MIT")
add_urls("https://github.com/braxtons12/hyperion_mpl/archive/refs/tags/v$(version).tar.gz",
         "https://github.com/braxtons12/hyperion_mpl.git")
add_versions("0.1.0", "ba55aa61d920ca02a91cc3e9fe107d0e0deea56f")
add_versions("0.2.0", "8c402100dbfb48d3d4246fbf0a8f3e1ea0715673")
add_versions("0.3.0", "8fdd8e99e4c9dfa4049b9f609143b97627decb2f")
add_versions("0.4.0", "5511fa68bf047948e161bb503b7795f618dd0e36")
add_versions("0.5.0", "510a5d1326006704505b00489ed8239986a5a6ce")
add_versions("0.6.0", "aee6119e1ef752d9d4642dd9495973f130c04ac5")
add_versions("0.7.0", "2ce1f9c3537733df99e84fd9f7155032bc1a5561")

add_configs("hyperion_enable_tracy",
    { description = "Enable Tracy profiling", default = false, values = { false, true } })
add_configs("hyperion_enable_testing",
    { description = "Enable Doctest testing macros", default = false, values = { false, true } })

on_load(function(package)
    package:add("deps", "hyperion_platform",
        {
            system = false,
            external = true,
            configs = {
                hyperion_enable_tracy = package:config("hyperion_enable_tracy"),
                hyperion_enable_testing = package:config("hyperion_enable_testing"),
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
    if package:config("hyperion_enable_testing") then
        configs.hyperion_enable_testing = true
    end
    import("package.tools.xmake").install(package, configs)
end)
