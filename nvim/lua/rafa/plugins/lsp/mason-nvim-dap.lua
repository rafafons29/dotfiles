local dap = vim.get_plugin("dap")
local dapui = vim.get_plugin("dapui")
if not dap then return end
if not dapui then return end


-- Configuración de nvim-dap-ui
dapui.setup()

-- Configurar auto apertura/cierre de dap-ui
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

-- Configuración de nvim-dap para C++
dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode', -- Ajusta esto según tu instalación de lldb-vscode
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- Si quieres soporte de visualización de memoria
    runInTerminal = false,
  },
}

-- Asignar <leader>db para establecer un breakpoint
vim.api.nvim_set_keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>',
  { noremap = true, silent = true })

-- Asignar <leader>dr para continuar a la próxima instrucción o iniciar la depuración
vim.api.nvim_set_keymap('n', '<leader>dr', '<cmd>lua require"dap".continue()<CR>', { noremap = true, silent = true })

-- Asigar <leader>dq para salir de la depuración
vim.api.nvim_set_keymap('n', '<leader>dq', '<cmd>lua require"dap".close()<CR>', { noremap = true, silent = true })
