-- lua/plugins/dap.lua
return {

  -- =========================
  -- Core DAP
  -- =========================
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- =========================
      -- GDB adapter (C / C++)
      -- =========================
      dap.defaults.fallback.terminal_win_cmd = "50vsplit new" -- optional for split terminal
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
      }
      dap.configurations.cpp = {
        {
          name = "Launch C++ (LLDB)",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      -- C uses same configuration
      dap.configurations.c = dap.configurations.cpp

      -- =========================
      -- Keymaps (SAFE & Vim-like)
      -- =========================
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      map("n", "<leader>db", dap.toggle_breakpoint, opts)
      map("n", "<leader>dc", dap.continue, opts)
      map("n", "<leader>do", dap.step_over, opts)
      map("n", "<leader>di", dap.step_into, opts)
      map("n", "<leader>dO", dap.step_out, opts)
      map("n", "<leader>dr", dap.repl.open, opts)
      map("n", "<leader>dq", dap.terminate, opts)
    end,
  },

  -- =========================
  -- DAP UI (windows, vars, stack)
  -- =========================
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup({
        layouts = {
          {
            elements = {
              "scopes",
              "breakpoints",
              "stacks",
              "watches",
            },
            size = 40,
            position = "left",
          },
          {
            elements = {
              "repl",
              "console",
            },
            size = 10,
            position = "bottom",
          },
        },
      })

      -- Auto open/close
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      vim.keymap.set("n", "<leader>dw", function()
        require("dapui").elements.watches.add()
      end, { desc = "DAP: Add watch" })

      vim.keymap.set("n", "<leader>du", dapui.toggle, { silent = true })
    end,
  },

  -- =========================
  -- Inline virtual text (🔥)
  -- =========================
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("nvim-dap-virtual-text").setup({
        commented = true,
      })
    end,
  },
}
