return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      "*",
    }, {
      RGB      = true,  -- dukung format #RGB
      RRGGBB   = true,  -- dukung format #RRGGBB
      names    = true,  -- dukung warna nama, misalnya 'Red', 'Blue'
      RRGGBBAA = true,  -- dukung format #RRGGBBAA (RGBA)
      rgb_fn   = true,  -- dukung rgb() & rgba() CSS
      hsl_fn   = true,  -- dukung hsl() & hsla() CSS
      css      = true,  -- aktifkan semua fitur CSS (rgb, hsl, nama, hex)
      css_fn   = true,  -- aktifkan semua fungsi CSS (rgb(), hsl(), dsb)
    })
  end,
}
