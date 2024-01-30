return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    local function add(lang)
      if type(opts.ensure_installed) == "table" then
        table.insert(opts.ensure_installed, lang)
      end
    end

    vim.filetype.add({
      extension = {
        templ = "templ",
      },
    })
    add("git_config")

    -- if have("fish") then
    --   add("fish")
    -- end
    --
    -- if have("rofi") or have("wofi") then
    --   add("rasi")
    -- end
  end,
}
