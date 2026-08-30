-- Soft wrapping for markdown buffers (AstroNvim sets `wrap = false` globally).
-- markview.nvim has built-in wrap support, so its rendering survives wrapped lines.

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      g = {
        -- tell markview how many columns the sign/number/statuscolumn take up
        -- so it can calculate wrapped rendering correctly
        markview_textoff = 8,
      },
    },
    autocmds = {
      markdown_wrap = {
        {
          event = "FileType",
          pattern = { "markdown", "markdown_inline", "mdx", "text", "gitcommit" },
          desc = "Enable soft wrapping in prose buffers",
          callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true -- wrap at word boundaries, not mid-word
            vim.opt_local.breakindent = true -- keep indentation on wrapped lines
            vim.opt_local.showbreak = ""
          end,
        },
      },
    },
  },
}
