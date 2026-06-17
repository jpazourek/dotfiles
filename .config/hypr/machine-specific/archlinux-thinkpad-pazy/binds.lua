local mainMod = "SUPER"

-- Multimedia keys for brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.local/bin/monitor-brightness-notify up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.local/bin/monitor-brightness-notify down"))

hl.bind(mainMod .. " + XF86MonBrightnessUp", hl.dsp.exec_cmd("~/.local/bin/keyboard-backlight-notify up"))
hl.bind(mainMod .. " + XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.local/bin/keyboard-backlight-notify down"))
