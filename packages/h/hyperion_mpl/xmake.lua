---@diagnostic disable: undefined-global,undefined-field
package("hyperion_mpl")
set_homepage("https://braxtons12.github.io/hyperion_mpl/")
set_description("C++20 Value-oriented Metaprogramming Library")
set_license("MIT")
add_urls("https://github.com/braxtons12/hyperion_mpl/archive/refs/tags/v$(version).tar.gz",
         "https://github.com/braxtons12/hyperion_mpl.git")
add_versions("0.1.0", "20f4723573544f8829045338611598dda0282f1471731bf58e46ec7ec70fafa2")
add_versions("0.2.0", "929facea8e0dd8755df5dbed20c4a2451e0eaf136782ee55d52f41d008955993")
add_versions("0.3.0", "24638bc0b771529a3a426b75d0840bc73c10aa23d1332e6071fdc5e5f69a93fd")
add_versions("0.4.0", "339f3a2abfda7bdc85091d6419b4302b7baccc786ca154a70955b7eb05d9b250")
add_versions("0.5.0", "b74e15781caff44d4d30a02d6d2a90366ced9d455e2d4e20198a7a5254c9f7a4")
add_versions("0.6.0", "39daaba8c6d50a421e758c69348be2db67b8e851d300a531e34dd7c6c9fdbbef")
add_versions("0.7.0", "1c5b282512a0faa3b22dbff32520b2b069139098259ba2da701222aca2c08f58")
add_versions("0.7.1", "2309256cb0b56febd3c30dc6c3f79799ce22864cf79ebd7584b3e8d60ea02071")
add_versions("0.7.2", "6a39a7ffd1d16a36f23bffc5a0787948aa42e736c49724956e4e008429204cec")
add_versions("0.8.0", "ad06a303fb53a0bcb7e7be768d49c4c7e2078db82fd4f7c6a9cc604705c42853")
add_versions("0.8.1", "1d8d4f7cf26b7b1d443aa710e245fa4f9d2d2f13dd93dfaa2c6264895aea1e92")
add_versions("0.8.2", "2afb283b4c89fedca1063baf03ba2f4eadfb6267eddabcc0708ceabc1fa90c33")
add_versions("0.8.3", "70da510a660bd4b51199c2d35c60b0474a22a16c2f004981928e41eea4381db6")
add_versions("0.8.4", "7436bd7228ac1c040ca8900a397be3c2b6a7753a654dc0386b7c392aff44cce7")

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

    if package:config("hyperion_enable_tracy") then
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
