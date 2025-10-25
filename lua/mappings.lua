-- General Mappings
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", ";", ":", { desc = "CMD enter command mode" })
vim.keymap.set("i", "jj", "<ESC>")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "toggle line number" })
vim.keymap.set("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
vim.keymap.set("n", "<leader>l", "<CMD>bnext<CR>")
vim.keymap.set("n", "<leader>h", "<CMD>bprev<CR>")
vim.keymap.set("n", "<leader>x", "<CMD>bd<CR>")
vim.keymap.set("n", "<leader>cc", "<CMD>cclose<CR>")
vim.keymap.set("n", "<leader>co", "<CMD>copen<CR>")

vim.keymap.set("n", "<leader>em", "<cmd>e ~/Repos/dotfiles/nvim/lua/mappings.lua<cr>")

-- life changing
vim.keymap.set("n", "<CR>", '@="m`o<C-V><Esc>``"<CR>')
vim.keymap.set("n", "<S-CR>", '@="m`O<C-V><Esc>``"<CR>')

vim.keymap.set("n", "<leader>th", function()
  require("nvchad.themes").open()
end, { desc = "telescope nvchad themes" })

-- Which Key
vim.keymap.set("n", "<leader>?", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

-- Lsp Mappings
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go To Definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Lsp Hover" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go To Implementation" })
vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "Go To Signature" })
vim.keymap.set("n", "grn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "Show References" })
vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = "View Symbol" })
vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help)

-- Diagnostic Mappings
local go_to_error = function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
end

vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "LSP diagnostic qflist" })
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "View Diagnostic" })
vim.keymap.set("n", "gE", go_to_error, { desc = "Go To Next Error" })

-- Oil Mappings
vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory." })

-- Lazygit Mappings
vim.keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>")

-- Telescope Mappings
local builtin = require "telescope.builtin"
vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope find all files" }
)
vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Telescope Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope Search Buffers" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope Old Files" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help" })
vim.keymap.set(
  "n",
  "<leader>fz",
  "<cmd>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "telescope find in current buffer" }
)

-- Trouble Mappings
vim.keymap.set("n", "<leader>tq", "<cmd>Trouble quickfix toggle<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>tx", "<cmd>Trouble diagnostics toggle<cr>")
vim.keymap.set(
  "n",
  "<leader>tX",
  "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
  { desc = "Trouble Show Diagnostics In File" }
)

-- UndoTree Mappings
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Harpoon Mappings
local mark = require "harpoon.mark"
local ui = require "harpoon.ui"
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function()
  ui.nav_file(1)
end)
vim.keymap.set("n", "<C-t>", function()
  ui.nav_file(2)
end)
vim.keymap.set("n", "<C-n>", function()
  ui.nav_file(3)
end)
vim.keymap.set("n", "<C-s>", function()
  ui.nav_file(4)
end)

-- Floating Terminal Mappings
vim.keymap.set("n", "<leader>tt", "<cmd>FloatingTerminal<cr>i", { desc = "Toggle Floating Terminal" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- Gitsigns Mappings
local gitsigns = require "gitsigns"

-- Navigation
vim.keymap.set("n", "]c", function()
  if vim.wo.diff then
    vim.cmd.normal { "]c", bang = true }
  else
    gitsigns.nav_hunk "next"
  end
end, { desc = "Next Git Hunk" })

vim.keymap.set("n", "[c", function()
  if vim.wo.diff then
    vim.cmd.normal { "[c", bang = true }
  else
    gitsigns.nav_hunk "prev"
  end
end, { desc = "Prev Git Hunk" })

-- Actions
vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git Stage Hunk" })
vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git Reset Hunk" })

vim.keymap.set("v", "<leader>gs", function()
  gitsigns.stage_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Git Stage Highlighted" })

vim.keymap.set("v", "<leader>gr", function()
  gitsigns.reset_hunk { vim.fn.line ".", vim.fn.line "v" }
end, { desc = "Git Reset Highlighted" })

vim.keymap.set("n", "<leader>gus", gitsigns.undo_stage_hunk, { desc = "Git Undo Stage Hunk" })

vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Git Stage Buffer" })
vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Git Reset Buffer" })
vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git Preview Hunk" })
vim.keymap.set("n", "<leader>gi", gitsigns.preview_hunk_inline, { desc = "Git Preview Hunk Inline" })

vim.keymap.set("n", "<leader>gb", function()
  gitsigns.blame_line { full = true }
end, { desc = "Git Blame" })

vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Git Diff" })

vim.keymap.set("n", "<leader>gQ", function()
  gitsigns.setqflist "all"
end)
vim.keymap.set("n", "<leader>gq", gitsigns.setqflist, { desc = "Git Hunks Qflist" })

-- Toggles
vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Current Link Blame" })
vim.keymap.set("n", "<leader>td", gitsigns.toggle_deleted)

-- Deubgger Mappings
-- vim.keymap.set("n", "<leader>du", require("dapui").toggle, { desc = "Toggle Deubgger UI" })
--
-- vim.keymap.set("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", { desc = "Toggle Breakpoint" })
-- vim.keymap.set("n", "<leader>dc", "<CMD>DapContinue<CR>", { desc = "Debugger Continue" })

-- NeoTest Mappings
local neo_test = require "neotest"
vim.keymap.set("n", "<leader>tr", function()
  neo_test.run.run {
    suite = false,
    testify = true,
  }
end, { desc = "Debug: Running Nearest Test" })

vim.keymap.set("n", "<leader>tv", function()
  neo_test.summary.toggle()
end, { desc = "Debug: Summary Toggle" })

vim.keymap.set("n", "<leader>ts", function()
  neo_test.run.run {
    suite = true,
    testify = true,
  }
end, { desc = "Debug: Running Test Suite" })

vim.keymap.set("n", "<leader>td", function()
  neo_test.run.run {
    suite = false,
    testify = true,
    strategy = "dap",
  }
end, { desc = "Debug: Debug Nearest Test" })

vim.keymap.set("n", "<leader>to", function()
  neo_test.output.open()
end, { desc = "Debug: Open test output" })

vim.keymap.set("n", "<leader>ta", function()
  neo_test.run.run(vim.fn.getcwd())
end, { desc = "Debug: Open test output" })

-- TODO Comments
local todo_comments = require "todo-comments"
todo_comments.setup()

vim.keymap.set("n", "<leader>ft", "<CMD>TodoTelescope<CR>", { desc = "Find Todo Comments" })
vim.keymap.set("n", "<leader>qt", "<CMD>TodoQuickFix<CR>", { desc = "Find Todo Comments" })
