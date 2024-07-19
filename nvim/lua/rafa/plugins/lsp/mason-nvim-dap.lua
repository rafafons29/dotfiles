local dap = noty.get_plugin("dap")
local dapui = noty.get_plugin("dapui")
if not dap then return end
if not dapui then return end

-- configuración de nvim-dap-ui
dapui.setup()

-- configurar auto apertura/cierre de dap-ui
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

-- configuración de nvim-dap para c++
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- ajusta esto según tu instalación de lldb-vscode
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspacefolder}',
    stoponentry = false,
    args = {},

    -- si quieres soporte de visualización de memoria
    runinterminal = false,
  },
}

keymap.set('n', '<leader>dr', function() dap.continue() end, { noremap = true, silent = true })
keymap.set('n', '<leader>dq', function() dap.close() end, { noremap = true, silent = true })
keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { noremap = true, silent = true })
