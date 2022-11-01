package = "kong-plugin-referer"
version = "2.0-0"

supported_platforms = {"linux", "macosx"}
source = {
  url = "git://github.com/Nextpertise/kong-plugin-referer",
  tag = "v2.0.0"
}

description = {
  summary = "Easily add referer access to your API by enabling this plugin",
  license = "MIT"
}

build = {
  type = "builtin",
  modules = {
    ["kong.plugins.referer.handler"] = "src/handler.lua",
    ["kong.plugins.referer.schema"] = "src/schema.lua"
  }
}
