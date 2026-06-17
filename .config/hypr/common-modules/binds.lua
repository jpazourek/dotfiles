local mainMod = "SUPER"

-- Terminal
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("kitty"))

-- Neovim
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("kitty -e nvim"))

-- File manager
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty -e yazi"))

-- Launcher
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show drun"))

-- Clipboard history
hl.bind(
	mainMod .. " + T",
	hl.dsp.exec_cmd("cliphist list | rofi -dmenu -config ~/.config/rofi/clipboard.rasi | cliphist decode | wl-copy")
)

-- Logout manager
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("wleave"))

-- Controls
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + A", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mainMod .. " + C", hl.dsp.window.close())

-- Pick a color in hex format
hl.bind("CONTROL + ALT + P", hl.dsp.exec_cmd("hyprpicker --autocopy --format=hex"))

-- Movement between windows
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Movement of windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Movement between and of workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + minus", hl.dsp.focus({ workspace = 11 }))
hl.bind(mainMod .. " + SHIFT + minus", hl.dsp.window.move({ workspace = 11 }))
hl.bind(mainMod .. " + equal", hl.dsp.focus({ workspace = 12 }))
hl.bind(mainMod .. " + SHIFT + equal", hl.dsp.window.move({ workspace = 12 }))

-- Multimedia keys for volume
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("~/.local/bin/volume-change-notify up"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("~/.local/bin/volume-change-notify down"),
	{ locked = true, repeating = true }
)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("~/.local/bin/volume-mute-notify"), { locked = true, repeating = true })
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

-- Screenshot
hl.bind("Print", hl.dsp.exec_cmd('grim -g "$(slurp)" - | swappy -f -'))

-- Screenshot and copy to clipboard
hl.bind("SUPER + Print", hl.dsp.exec_cmd('grim -g "$(slurp -d)" - | wl-copy'))
