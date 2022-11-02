package = "kong-plugin-consumer-referer"
version = "1.0-0"

supported_platforms = {"linux", "macosx"}
source = {
  url = "git://github.com/Nextpertise/kong-plugin-referer",
  tag = "v2.0.0"
}

description = {
  summary = "Easily add referer access to your API by enabling this plugin",
  license = "MIT"
}

dependencies = {
  "lua >= 5.1"
}


build = {
  type = "builtin",
  modules = {
    ["kong.plugins.consumer-referer.handler"] = "src/handler.lua",
    ["kong.plugins.consumer-referer.schema"] = "src/schema.lua"
  }
}
