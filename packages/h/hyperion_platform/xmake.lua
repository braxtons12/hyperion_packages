---@diagnostic disable: undefined-global,undefined-field
package("hyperion_platform")
set_homepage("https://braxtons12.github.io/hyperion_platform/")
set_description("Platform and Architecture Detection and Feature Test Macros for C++. Part of Hyperion Engine.")
set_license("MIT")
add_urls("https://github.com/braxtons12/hyperion_platform/archive/refs/tags/v$(version).tar.gz",
         "https://github.com/braxtons12/hyperion_platform.git")
add_versions("0.1.0", "09fe0136e1777bd5e11d78085f3f3b2c7c49c83b2a9594f63c19b5f1b8f34e75")
add_versions("0.1.1", "ff793776427239f57162658e1a0de21974bf82bfdb62a080538820e786e7edb1")
add_versions("0.1.2", "b3084ff288a83c8265bc3b2a46ec5209ce78549f4860abd721ddab7d4244d6cb")
add_versions("0.1.3", "2bb376d13058f8658b3bd55954ea1b916e02cc4da379ad6225fbbd79f81e1c9d")
add_versions("0.1.4", "ef276f13ae8e4736f995113715e03ed76bcf58f267fab7c62c9d097e186c7b3b")
add_versions("0.2.0", "9a0874fcf79b6d0da6984a132919730e8abccef1fc42a955c91861334efe40e1")
add_versions("0.2.1", "bafc20247709eb8c611034d38aad7f6253329049a8ee786c26d7eb83e81501bb")
add_versions("0.2.2", "db2577af079dc2bf4d94099f07c98c453f24028847b7c2610190a74d4d9e734e")
add_versions("0.2.3", "8a3e5a33810a7432954da6cfb8859560b4e6320214700b0601b1b428be32e0d4")
add_versions("0.2.4", "96cb9136e2687c9ad94c658d35816b3f161cccf13c8497b5e0824b267f87248f")

add_configs("hyperion_enable_tracy", { description = "Enable Tracy profiling", default = false, values = { false, true } })

on_load(function(package)
    if package:config("hyperion_enable_tracy") then
        package:add("deps", "tracy", {
            system = false,
            external = true,
            configs = {
                languages = "cxx20"
            }
        })

        package:add("defines", "TRACY_ENABLE=1", {public = true})
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
