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
add_versions("0.3.0", "c6bcaaece9a7a96f4ea61a117a47e64277aac1d0672b8e00bfe8bc7370037327")
add_versions("0.3.1", "bbe370817d5f054b9f88062a4df2c3877c90c5468cddf92f3ddec29a9fd2c8b7")
add_versions("0.3.2", "d77ad875bd27ed56525d7497a2df768976af91990ab0569bbf91c476d1df2cef")
add_versions("0.4.0", "e62ab8fef26e8c37b263275428cb9ca156ddce877b2b4cc9a860d058d5db6c38")
add_versions("0.4.1", "9bff7f01f58d0e9d68b57520956e95b9c4f35d2c255bc25d02972f3a9da0b627")
add_versions("0.4.2", "f7caa3aaa3fbd78159bc6d9d702c0c39751fe4dbe18de610165f51f3a8a3bb2c")
add_versions("0.5.0", "4995fc42f12ad23ee7ca00b5addc5a3536be325d3640c68b7e926e701c53f7f2")
add_versions("0.5.1", "b212e9f6fe0588783d1cbd9c232a23346e32cab5237f422771988d989d091b9c")
add_versions("0.5.2", "189bb08d8ae0aab34aeb6d0d80fdb09f0844faeedffb919353c2760ef56379cb")
add_versions("0.5.3", "5b2b93b852549102e3882a275f97aae5cfd26ea93f5a679d7c3cf67e795be023")
add_versions("0.5.4", "6b0512886735b0cd9fa2be728661844294489b472ab518249b23717ff3e1b19a")
add_versions("0.5.5", "6167d7a4e308e289d8a007c4a535caa27cecc9867b1eb92ec218cbbacf79eae3")

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

    local version = package:version();
    if version == nil or version:major() > 0 or version:minor() >= 5 then
        package:add("deps", "fast_float", {
            system = false,
            external = true,
            configs = {
                languages = "cxx20",
            },
        })
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
