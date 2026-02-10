return {
	"sakhnik/nvim-gdb",
	cmd = {
		"GdbStart",
		"GdbStartLLDB",
		"GdbStartPDB",
		"GdbStartBashDB",
		"GdbStartRR",
	},
	config = function()
		-- Optional: override default key behavior safely
		vim.g.nvimgdb_config_override = {
			-- navigation
			key_next = "<F10>",
			key_step = "<F11>",
			key_finish = "<F12>",
			key_continue = "<F5>",
			key_breakpoint = "<F8>",

			-- prevent single-letter mappings in terminal
			set_tkeymaps = "NvimGdbNoTKeymaps",
		}

		-- Function required by set_tkeymaps
		vim.cmd([[
			function! NvimGdbNoTKeymaps()
				tnoremap <silent> <buffer> <Esc> <C-\><C-n>
			endfunction
		]])
	end,
}
