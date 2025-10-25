return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "fredrikaverpil/neotest-golang",
    "nvim-neotest/neotest-python",
    "rouge8/neotest-rust",
    "alfaix/neotest-gtest",
    "nvim-neotest/neotest-plenary",
    "leoluz/nvim-dap-go",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require "neotest-golang" {
          dap = { justMyCode = false },
        },
        require "neotest-python" {
          dap = { justMyCode = false },
        },
        require "neotest-rust" {
          dap = { justMyCode = false },
        },
        require "neotest-gtest",
        require "neotest-plenary",
      },
    }
  end,
}
