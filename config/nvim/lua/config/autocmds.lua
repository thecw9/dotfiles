local cmd = vim.api.nvim_create_autocmd

local function augroup(name)
	return vim.api.nvim_create_augroup("thecw_" .. name, { clear = true })
end

-- Highlight on yank
cmd("TextYankPost", {
	group = augroup("highlight_yank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Format
-- cmd("BufWritePost", {
-- 	group = augroup("format_autogroup"),
-- 	callback = function()
-- 		vim.cmd("FormatWrite")
-- 	end,
-- })

-- transparent background
-- cmd("VimEnter", {
--   group = augroup("transparent_background"),
--   callback = function()
--     vim.cmd("hi Normal guibg=NONE")
--     vim.cmd("hi EndOfBuffer guibg=NONE")
--   end,
-- })
