local blink = require("blink.cmp")

blink.setup({
  keymap = { preset = "enter" },
  appearance = { use_nvim_cmp_as_default = true, nerd_font_variant = "mono" },
  sources = { default = { "lsp", "path", "snippets", "buffer" } },
  fuzzy = {
    implementation = "lua",
    --prebuilt_binaries = { force_version = "1.*" },
  },
})
