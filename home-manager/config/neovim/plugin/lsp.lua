local on_attach = function(_, bufnr)
	-- KeyBindings: 
	local bufmap = function(keys, func)
	  vim.keymap.set('n', keys, func, { buffer = bufnr })
	end
	
	bufmap('gd', vim.lsp.buf.definition)
	bufmap('gD', vim.lsp.buf.declaration)
	bufmap('gI', vim.lsp.buf.implementation)
	bufmap('<leader>D', vim.lsp.buf.type_definition)
	bufmap('gr', require('telescope.builtin').lsp_references)
	bufmap('K', vim.lsp.buf.hover)


	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
  	  vim.lsp.buf.format()
  	end, {})
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- Help on the nvim lua api (and docs!)
require('neodev').setup()

-- Configuring the Language Servers
local lspconfig = require("lspconfig")

-- Bash lsp 
lspconfig["bashls"].setup({
    on_attach = on_attach,
    capabilities = capabilities,
})


-- Lua Lsp
lspconfig["lua_ls"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
	root_dir = function()
        return vim.loop.cwd()
    end,
	cmd = {"lua-language-server"},
    settings = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
        },
    }
}

-- Nix Lsp
lspconfig["rnix"].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  	root_dir = function()
  	     return vim.loop.cwd()
  	end,
}

-- Python lsp
lspconfig["pyright"].setup({
	on_attach = on_attach,
    capabilities = capabilities,
  	root_dir = function()
  	     return vim.loop.cwd()
  	end,
})

-- Yaml lsp
lspconfig["yamlls"].setup({
	on_attach = on_attach,
    capabilities = capabilities,
  	root_dir = function()
  	     return vim.loop.cwd()
  	end,
	cmd = {"yamlls"},
})

-- Go Lsp
lspconfig["gopls"].setup({
	on_attach = on_attach,
  	capabilities = capabilities,
  	root_dir = function()
  	     return vim.loop.cwd()
  	end,
	cmd = {"gopls"},
  	settings = {
  	  gopls = {
  	    env = {
  	        GOFLAGS = "-tags=windows,linux,unittest,integration,unit"
  	    }
  	  }
  	},
})
