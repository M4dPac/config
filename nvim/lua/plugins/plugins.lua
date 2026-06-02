return {
  -- { "mason-org/mason.nvim", version = "^1.0.0" },
  -- { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        enabled = false,
        sources = {
          explorer = {
            layout = {
              preview = "main",
            },
          },
        },
      },
    },
  },
  {
    "hinell/lsp-timeout.nvim",
    enabled = false,
    dependencies={
        "neovim/nvim-lspconfig"
    }
  },
  -- Даже если включена русская раскладка vim команды будут работать
  {"powerman/vim-plugin-ruscmd", enabled = true},
{
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          autostart = false,
          settings = {
            ["rust-analyzer"] = {
              -- Ограничиваем индексацию только нужными крейтами
              -- linkedProjects говорит RA работать только с этими Cargo.toml
              -- linkedProjects = {
              --   "crates/streambridge-core/Cargo.toml",
              --   "crates/streambridge-app/Cargo.toml",
              -- },

              -- Уже есть у тебя, оставляем:
              lru = { capacity = 64 },
              procMacro = { enable = false },

              -- Дополнительно снижаем потребление:
              checkOnSave = {
                enable = true,
                command = "clippy",
                extraArgs = { "--locked", "--lib", "--bins", "--", "-D", "warnings", "-W", "clippy::unwrap_used" },
              },
              diagnostics = {
                -- Только открытые файлы, не весь workspace
                disabled = { "unresolved-proc-macro" },
              },
              cargo = {
                -- Не собираем все фичи
                features = {},
                -- Исключаем тяжёлые крейты из анализа
                noDefaultFeatures = false,
                buildScripts = { enable = false },
              },
              -- files = {
              --   -- Явно исключаем то, с чем не работаем
              --   excludeDirs = {
              --     "target",
              --     "node_modules",
              --   },
              -- },
            },
          },
        },
      },
    },
  },
  -- Перехватываем автостарт RA
  init = function()
    -- Флаг: false = RA запущен пользователем вручную
    vim.g.ra_manual = false

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "rust_analyzer" and not vim.g.ra_manual then
          client:stop()
          vim.notify(
            "rust-analyzer: автостарт заблокирован.\nЗапусти вручную: <leader>rs",
            vim.log.levels.WARN
          )
        end
      end,
    })
  end,
}
