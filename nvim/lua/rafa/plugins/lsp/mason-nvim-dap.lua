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
