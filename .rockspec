package = "Garrysmod"
version = "18.08.14"
grammar = "lua-5.2"
flags = { ee = true }
description = {
  summary = "Garrys Mod Execution Environment",
  detailed = [[ An execution environment that mirrors the specs laid out on the Garry's Mod Wiki. ]],
  license = "MIT",
  homepage = "https://gmod.facepunch.com/",
  issues_url = "https://github.com/Facepunch/garrysmod-issues",
}
api = {
  file = "api.zip"
}
documentation = {
  dir = "docs"
}
templates = {
--[[  default = {
    buildpath = {"/"},
    openfile = ""
  }--,
  gamemode = {
    
  }]]--
}