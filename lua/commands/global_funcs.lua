-- minhas_funcoes.lua
local M = {}

function M.osInfo()
  local OSINFO = {}
  local uname = vim.loop.os_uname();
  OSINFO.OS = uname.sysname;
  OSINFO.IS_MAC = OSINFO.OS == 'Darwin'
  OSINFO.IS_LINUX = OSINFO.OS == 'Linux'
  OSINFO.IS_WINDOWS = OSINFO.OS:find 'Windows' and true or false
  OSINFO.IS_WSL = OSINFO.IS_LINUX and uname.release:find 'Microsoft' and true or false
  return OSINFO;
end

function M.getCurrShell()
  local OS = M.osInfo();
  local bool = true;
  if OS.IS_WINDOWS then
    return "powershell"
  elseif OS.IS_LINUX then
    return "zsh"
  else
    error("Sistema não identificado pra buscar o shell")
  end
end

return M
