local builtin = require("telescope.builtin")
local dap = require("dap")
local dapui = require("dapui")
local helpers = require("utils.helpers")

-- Mappings ordered under <LEADER> in a logical namespace
-- for use with which-key (my memory fades..🕱)
-- * b - Buffers
-- * d - Debugger
-- * f - Find
-- * g - Git
-- * l - LSP
-- * p - Packages

local mappings = {
    -- Top level useful commands
    { "n", "<LEADER><LEADER>", "<C-^>",                   "Open last buffer" },
    { "n", "<LEADER>w",        "<cmd>write<CR>",          "Save" },
    { "n", "<LEADER>q",        "<cmd>q<CR>",              "Quit" },
    { "n", "<LEADER>e",        "<cmd>Lexplore %:p:h<CR>", "Open File Explorer" },
    { "n", "<LEADER>t",        "<cmd>TroubleToggle<CR>",  "Toggle Trouble" },
    { "n", "<C-l>",            "<cmd>bnext<CR>",          "Next buffer" },
    { "n", "<C-h>",            "<cmd>bprevious<CR>",      "Previous buffer" },
    { "n", "<C-x>",            "<cmd>bdelete<CR>",        "Close buffer" },

    -- Comment/Uncomment in insert and visual mode
    {
        "n",
        "<LEADER>/",
        function()
            require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
        end,
        "Comment line",
    },
    {
        "v",
        "<LEADER>/",
        function()
            require("Comment.api").toggle.linewise(vim.fn.visualmode())
        end,
        "Comment line",
    },

    -- Buffers
    { "n", "<LEADER>bc", "<cmd>bdelete<CR>",             "Close buffer" },
    { "n", "<LEADER>bn", "<cmd>bnext<CR>",               "Next buffer" },
    { "n", "<LEADER>bp", "<cmd>bprevious<CR>",           "Previous buffer" },

    -- Debugger (D) namespace
    { "n", "<LEADER>dc", "<cmd>DapContinue<CR>",         "Continue" },
    { "n", "<LEADER>db", "<cmd>DapToggleBreakpoint<CR>", "Toggle breakpoint" },
    {
        "n",
        "<LEADER>dB",
        function()
            vim.ui.input({ prompt = "Condition: " }, function(expr)
                if expr then
                    dap.toggle_breakpoint(expr)
                end
            end)
        end,
        "Conditional breakpoint",
    },
    { "n", "<LEADER>di", "<cmd>DapStepInto<CR>",     "Step into" },
    { "n", "<LEADER>dO", "<cmd>DapStepOut<CR>",      "Step out" },
    { "n", "<LEADER>do", "<cmd>DapStepOver<CR>",     "Step over" },
    { "n", "<LEADER>dq", "<cmd>DapTerminate<CR>",    "Close session" },
    { "n", "<LEADER>dR", "<cmd>DapRestartFrame<CR>", "Restart debugger" },
    {
        "n",
        "<LEADER>dE",
        function()
            vim.ui.input({ prompt = "Expression: " }, function(expr)
                if expr then
                    dapui.eval(expr)
                end
            end)
        end,
        "Evaluate Input",
    },
    {
        "n",
        "<LEADER>du",
        function()
            dapui.toggle()
        end,
        "Toggle Debugger UI",
    },
    {
        "n",
        "<LEADER>dh",
        function()
            dapui.hover()
        end,
        "Debugger Hover",
    },

    -- Find (F) namespace
    { "n", "<LEADER>f'", "<cmd>Telescope marks<CR>",       "Find marks" },
    { "n", "<LEADER>fb", "<cmd>Telescope buffers<CR>",     "Find buffers" },
    { "n", "<LEADER>fb", "<cmd>Telescope grep_string<CR>", "Find word under cursor" },
    { "n", "<LEADER>fC", "<cmd>Telescope commands<CR>",    "Find commands" },
    { "n", "<LEADER>ff", "<cmd>Telescope find_files<CR>",  "Find files" },
    { "n", "<LEADER>ff", "<cmd>Telescope find_files<CR>",  "Find files" },
    {
        "n",
        "<LEADER>fF",
        function()
            builtin.find_files()({ hidden = true, no_ignore = true })
        end,
        "Find all files",
    },
    { "n", "<LEADER>fg", "<cmd>Telescope live_grep<CR>",            "Find words" },
    { "n", "<LEADER>fh", "<cmd>Telescope help_tags<CR>",            "Find help" },
    { "n", "<LEADER>fm", "<cmd>Telescope man_pages<CR>",            "Find man" },

    -- LSP (L) namespace
    { "n", "<LEADER>li", "<CMD>LspInfo<CR>",                        "LSP information" },
    { "n", "<LEADER>lI", "<CMD>NullLsInfo<CR>",                     "NullLs information" },
    { "n", "<LEADER>ld", vim.lsp.buf.definition,                    "Go to definition" },
    { "n", "<LEADER>lD", "<CMD>Telescope diagnostics<CR>",          "Search diagnostics" },
    { "n", "<LEADER>ls", "<CMD>Telescope lsp_document_symbols<CR>", "Search symbols" },
    { "n", "<LEADER>lk", vim.lsp.buf.hover,                         "Hover information" },
    { "n", "<LEADER>lr", vim.lsp.buf.rename,                        "Rename string" },
    { "n", "<LEADER>lS", vim.lsp.buf.signature_help,                "Signature help" },

    -- Packages (P) namespace
    { "n", "<LEADER>pi", "<CMD>Lazy install<CR>",                   "Plugins install" },
    { "n", "<LEADER>ps", "<CMD>Lazy home<CR>",                      "Plugins status" },
    { "n", "<LEADER>pS", "<CMD>Lazy sync<CR>",                      "Plugins sync" },
    { "n", "<LEADER>pu", "<CMD>Lazy check<CR>",                     "Plugins check updates" },
    { "n", "<LEADER>pU", "<CMD>Lazy update<CR>",                    "Plugins update" },
}

for _, v in pairs(mappings) do
    helpers.setMapping(v[1], v[2], v[3], v[4])
end
