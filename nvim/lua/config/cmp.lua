vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},

	sources = {
		{name = 'path'},
		{name = 'nvim_lsp', keyword_length = 1},
		{name = 'buffer', keyword_length = 3},
		{name = 'luasnip', keyword_length = 2},
	},

	experimental = {
		ghost_text = {
			hl_group = "CmpGhostText",
		},
	},


	window = {
		documentation = cmp.config.window.bordered()
	},

	formatting = {
	    format = lspkind.cmp_format({ with_text = false, maxwidth = 50 }),
	},

	mapping = {
	['<Up>'] = cmp.mapping.select_prev_item(select_opts),
	['<Down>'] = cmp.mapping.select_next_item(select_opts),

	['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
	['<C-n>'] = cmp.mapping.select_next_item(select_opts),

	['<C-u>'] = cmp.mapping.scroll_docs(-4),
	['<C-d>'] = cmp.mapping.scroll_docs(4),

	['<C-e>'] = cmp.mapping.abort(),
	['<C-y>'] = cmp.mapping.confirm({select = true}),
	['<CR>'] = cmp.mapping.confirm({select = false}),

	['<C-f>'] = cmp.mapping(function(fallback)
		if luasnip.jumpable(1) then
			luasnip.jump(1)
		else
			fallback()
		end
	end, {'i', 's'}),

	['<C-b>'] = cmp.mapping(function(fallback)
		if luasnip.jumpable(-1) then
		luasnip.jump(-1)
		else
		fallback()
		end
	end, {'i', 's'}),

	['<C-Tab>'] = cmp.mapping(function(fallback)
		local col = vim.fn.col('.') - 1

		if cmp.visible() then
			cmp.select_next_item(select_opts)
		elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
			fallback()
		else
			cmp.complete()
		end
	end, {'i', 's'}),

	['<S-Tab>'] = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item(select_opts)
		else
			fallback()
		end
	end, {'i', 's'}),
	},
})

vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
