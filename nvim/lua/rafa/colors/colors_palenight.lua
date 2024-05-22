return function(global_theme)
  local M = {}

  M.insert = '#40a0ee'
  M.visual = '#79dac8'
  M.fg_a_z = '#030303'
  M.fg_b_y = '#c6c6c6'
  M.normal = '#a050d5'

  if (global_theme == "palenight") then
    M.bg_b_y = '#2e3651'
  elseif (global_theme == "defdark") then
    M.bg_b_y = '#101010'
  end

  return M
end
