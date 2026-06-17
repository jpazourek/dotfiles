local hostname = require("common-modules.host").hostname

require("common-modules.env")
require("common-modules.autostart")
require("common-modules.core")
require("common-modules.animations")
require("common-modules.binds")
require("common-modules.rules")

local path = "machine-specific." .. hostname .. "."

require(path .. "binds")
require(path .. "monitors")
require(path .. "rules")
