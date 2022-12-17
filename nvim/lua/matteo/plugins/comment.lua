-- put comment into comment variuable
-- if not installed do nothing
local setup, comment = pcall(require, "Comment")
if not setup then
	return
end

-- if installed
comment.setup()
