return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local c = require("vscode.colors").get_colors()
      require("vscode").setup({
        -- Enable transparent background
        transparent = false,
        
        -- Enable italic comments
        italic_comments = true,
        
        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,
        
        -- Override colors
        color_overrides = {
          -- You can override specific colors if needed
          -- Example:
          -- vscLineNumber = '#FFFFFF',
        },
        
        -- Override highlight groups
        group_overrides = {
          -- Examples of what you can override:
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
          -- Make comments slightly more vivid than default
          Comment = { fg = "#6A9955", italic = true },
          -- Make functions bold
          Function = { bold = true },
          -- Make keywords (like if, for, return) bold and italic
          Keyword = { italic = true, bold = true },
        }
      })
      
      -- Use the dark theme
      vim.cmd("colorscheme vscode")
      
      -- Alternatively, use light theme with:
      -- vim.cmd("colorscheme vscode_light")
    end,
  }
}
