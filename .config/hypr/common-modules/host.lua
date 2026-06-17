local M = {}

local function getHostname()
	local file = io.open("/etc/hostname", "r")
	if not file then
		return nil
	end

	local hostname = file:read("*l")
	file:close()

	if hostname and hostname ~= "" then
		return hostname
	end

	return nil
end

M.hostname = getHostname()

if not M.hostname then
	error("Could not determine hostname from /etc/hostname")
end

hl.env("HYPR_HOST", M.hostname)

return M
