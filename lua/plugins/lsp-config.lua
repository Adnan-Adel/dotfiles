return {
	{
		-- mason
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		-- mason-lspconfig
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "ts_ls", "gopls", "rust_analyzer", "pyright", "omnisharp" },
			})
		end,
	},
	{
		-- nvim-lspconfig
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				capabilities = capabilities,
			})
			lspconfig.rust_analyzer.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.omnisharp.setup({
				cmd = {
					vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp",
					"--languageserver",
					"--hostPID",
					tostring(vim.fn.getpid()),
				},
				capabilities = capabilities,
			})

			-- lspconfig.omnisharp.setup({
			-- 	cmd = {
			-- 		vim.fn.stdpath("data") .. "/mason/packages/omnisharp/omnisharp",
			-- 		"--languageserver",
			-- 		"--hostPID",
			-- 		tostring(vim.fn.getpid()),
			-- 	},
			-- 	capabilities = capabilities,
			-- 	enable_editorconfig_support = true,
			-- 	enable_ms_build_load_projects_on_demand = false,
			-- 	enable_roslyn_analyzers = true,
			-- 	organize_imports_on_format = true,
			-- 	enable_import_completion = true,
			-- 	sdk_include_prereleases = true,
			-- 	analyze_open_documents_only = false,
			-- })

			-- keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
