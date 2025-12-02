return {
  "RaafatTurki/hex.nvim",
  config = function()
    require("hex").setup({
      -- CLI command used to dump hex data
      dump_cmd = 'xxd -g 1 -u',

      -- CLI command used to assemble from hex data
      assemble_cmd = 'xxd -r',

      -- OPTIONAL: custom binary detection (default is usually fine)
      is_file_binary_pre_read = function()
        -- your custom logic, must return true or false
        return false
      end,

      is_file_binary_post_read = function()
        -- your custom logic, must return true or false
        return false
      end,
    })
  end
}
