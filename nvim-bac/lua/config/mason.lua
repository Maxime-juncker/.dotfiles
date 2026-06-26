
require("mason").setup({
	ui = {
		border = "rounded",
		icons = {
			package_installed   = "✓",
			package_pending     = "➜",
			package_uninstalled = "✗",
		},
	},
})

require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",                     -- TypeScript / JavaScript
		"svelte",                    -- Svelte
		"lua_ls",                    -- Lua
		"clangd",                    -- C / C++
		"dockerls",                  -- Dockerfile
		"docker_compose_language_service", -- Docker Compose
		"html",                      -- HTML
		"cssls",                     -- CSS / SCSS / LESS
		"tailwindcss",               -- Tailwind CSS
	},
	automatic_installation = true,
})
