-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>mq"] = { "<cmd>ObsidianQuickSwitch<cr>", desc = "Quick switch" },
    ["<leader>mn"] = { "<cmd>ObsidianNew<cr>", desc = "Create new note" },
    ["<leader>mf"] = { "<cmd>ObsidianSearch<cr>", desc = "Search notes" },
    ["<leader>mt"] = { "<cmd>ObsidianToday<cr>", desc = "Go to todays note" },
    ["<leader>my"] = { "<cmd>ObsidianYesterday<cr>", desc = "Go to yesterdays note" },
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>m"] = { name = "Manage Obsidian" },
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    --
    -- ChatGPT plugin mappings
    --
    ["<leader>at"] = { "<cmd>ChatGPT<cr>", desc = "Open ChatGPT" },
    ["<leader>as"] = { "<cmd>ChatGPTActAs<cr>", desc = "Act as" },
    ["<leader>ae"] = { "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Instruct and write" },
    ["<leader>ac"] = { "<cmd>ChatGPTCompleteCode<cr>", desc = "Complete Code" },
    ["<leader>ax"] = { "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain code" },
    ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix bugs" },
  },
  v = {

    -- ChatGPT plugin mappings
    --
    ["<leader>at"] = { "<cmd>ChatGPT<cr>", desc = "Open ChatGPT" },
    ["<leader>as"] = { "<cmd>ChatGPTActAs<cr>", desc = "Act as" },
    ["<leader>ae"] = { "<cmd>ChatGPTEditWithInstructions<cr>", desc = "Instruct and write" },
    ["<leader>ac"] = { "<cmd>ChatGPTCompleteCode<cr>", desc = "Complete Code" },
    ["<leader>ax"] = { "<cmd>ChatGPTRun explain_code<cr>", desc = "Explain code" },
    ["<leader>af"] = { "<cmd>ChatGPTRun fix_bugs<cr>", desc = "Fix bugs" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },

}
