package = "lulpeg"
version = "0.1.1-1"

source = {
  url = "git+https://github.com/tarantool/LuLPeg",
  tag = "v0.1.1",
}

description = {
  summary     = "LuLPeg",
  detailed    = "LuLPeg, a pure Lua port of LPeg, Roberto Ierusalimschy's Parsing Expression Grammars library. Copyright (C) Pierre-Yves Gerardy.",
  license     = "The Romantic WTF public license",
  maintainer  = "Tarantool Authors",
}

dependencies = {
  "lua >= 5.1",
}

build = {
  type = "command",
  build_command = "cd src; tarantool ../scripts/pack.lua > ../lulpeg.lua",
  install = {
    lua = {
      ["lulpeg"] = "lulpeg.lua",
    }
  }
}
