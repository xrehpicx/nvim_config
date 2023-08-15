return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "catppuccin",
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1500, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    vim.g.neoformat_try_node_exe = 1
    local alpha = function()
      return string.format("%x", math.floor(255 * (vim.g.transparency or 0.8)))
    end
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    -- vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_cursor_vfx_mode = "sonicboom"

    vim.g.neovide_transparency = 0.0
    vim.g.transparency = 0.99
    vim.g.neovide_background_color = "#101014" .. alpha()

    vim.g.neovide_refresh_rate = 120
    -- vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_confirm_quit = true
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_antialiasing = true

    vim.g.neovide_input_use_logo = false

    if vim.g.vscode then
      -- VSCode extension
    else
      -- ordinary Neovim
    end



    ---Common perf related flags for all the LSP servers
    local flags = {
      allow_incremental_sync = true,
      debounce_text_changes = 200,
    }

    ---Common capabilities including lsp snippets and autocompletion

    require('lspconfig').rust_analyzer.setup({
      flags = flags,
      settings = {
        ['rust-analyzer'] = {
          cargo = {
            allFeatures = true,
            ["ssr"] = true
          },
          checkOnSave = {
            allFeatures = true,
            command = 'clippy',
          },
          procMacro = {
            ignored = {
              ['async-trait'] = { 'async_trait' },
              ['napi-derive'] = { 'napi' },
              ['async-recursion'] = { 'async_recursion' },
            },
          },
        },
      },
    })
    require('lspconfig').tailwindcss.setup {
      settings = {
        scss = { validate = false },
        editor = {
          quickSuggestions = { strings = true },
          autoClosingQuotes = 'always',
        },
        filetypes = {
          "css",
          "scss",
          "sass",
          "html",
          "heex",
          "elixir",
          "eruby",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "rust",
          "svelte",
        },

        tailwindCSS = {
          allow_filetypes = {
            "css",
            "scss",
            "sass",
            "html",
            "heex",
            "elixir",
            "eruby",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "rust",
            "svelte",
          },
          experimental = {
            classRegex = {
              'cn`([^`]*)',          -- tw`...`
              'cn="([^"]*)',         -- <div tw="..." />
              'cn={"([^"}]*)',       -- <div tw={"..."} />
              'cn\\.\\w+`([^`]*)',   -- tw.xxx`...`
              'cn\\(.*?\\)`([^`]*)', -- tw(Component)`...`
              'cva`([^`]*)',         -- tw`...`
              'cva="([^"]*)',        -- <div tw="..." />
              'cva={"([^"}]*)',      -- <div tw={"..."} />
              'cva\\.\\w+`([^`]*)',  -- tw.xxx`...`
              'cva(*',               -- tw(Component)`...`
              'tw`([^`]*)',          -- tw`...`
              'tw="([^"]*)',         -- <div tw="..." />
              'tw={"([^"}]*)',       -- <div tw={"..."} />
              'tw\\.\\w+`([^`]*)',   -- tw.xxx`...`
              'tw\\(.*?\\)`([^`]*)', -- tw(Component)`...`
            },
          },
          includeLanguages = {
            typescript = 'javascript',
            typescriptreact = 'javascript',
          },
        },
      },
    }
    vim.api.nvim_set_option('conceallevel', 2)
    -- vim.api.nvim_exec("set conceallevel=3", true)
  end,
}
