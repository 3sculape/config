return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "rust",
        "vim",
        "yaml",
        "zig",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- lint
        "ruff",
        "shellcheck",
        -- server
        "clangd",
        "ltex-ls",
        "lua-language-server",
        "pyright",
        "tectonic",
        "texlab",
        "zls",
        -- format
        "clang-format",
        "prettier",
        "prettierd",
        "shfmt",
        "stylua",
        "taplo",
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        asm = { "asmfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        css = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        javascript = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        latex = { "latexindent" },
        lua = { "stylua" },
        markdown = { { "prettierd", "prettier" } },
        python = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
        scss = { { "prettierd", "prettier" } },
        sh = { "shfmt" },
        tex = { "latexindent" },
        toml = { "taplo" },
        typescript = { { "prettierd", "prettier" } },
        typst = { "typstfmt" },
        yaml = { { "prettierd", "prettier" } },
        rust = { "rustfmt" },
        zig = { "zigfmt" },
        xml = { "xmlformatter" },
        ["_"] = { "trim_whitespace" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-8" }
          opts.cmd = { "clangd", "--header-insertion=never", "--background-index", "--clang-tidy", "--log=verbose" }
        end,
        zls = function(_, opts)
          opts.enable_inlay_hints = true
          opts.use_comptime_interpreter = true
        end,
        textlab = function(_, opts)
          opts.settings.textlab = {
            auxDirectory = ".",
            bibtexFormatter = "texlab",
            build = {
              args = {
                "-X",
                "compile",
                "%f",
                "--synctex",
                "--keep-logs",
                "--keep-intermediates",
              },
              executable = "tectonic",
            },
            diagnosticsDelay = 300,
          }
        end,
        ltex = function(_, opts)
          opts.settings = { ltex = { language = "fr" } }
        end,
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        c = { "clangtidy" },
        cpp = { "clangtidy" },
        python = { "ruff" },
        sh = { "shellcheck" },
        nix = { "nix" },
        make = { "checkmake" },
      },
      linters = {
        clangtidy = {
          args = {
            "-checks='clang-analyzer-*,concurrency-*,performance-*,portability-*'",
            "--quiet",
          },
        },
        pylint = {
          args = {
            "-f",
            "json",
            "--disable=R,missing-docstring,invalid-name",
          },
        },
        shellcheck = {
          args = {
            "-x",
            "--format",
            "json",
            "-",
          },
        },
      },
    },
  },
}
