return {
  'norcalli/nvim-colorizer.lua',
  opts = function()
    local colorizer = require('colorizer')
    
    return {
      '*',  -- Configura el colorizador para todos los archivos
    }
  end,
}
