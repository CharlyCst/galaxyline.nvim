local vim,lsp,api,diagnostic = vim,vim.lsp,vim.api,vim.diagnostic
local M = {}

-- nvim-lspconfig
-- see https://github.com/neovim/nvim-lspconfig
local function get_nvim_lsp_diagnostic(diag_type)
  if next(lsp.get_clients({bufnr = 0})) == nil then return '' end
  local active_clients = lsp.get_clients({bufnr = 0})

  if active_clients then
    local result = diagnostic.get(vim.api.nvim_get_current_buf(), { severity = diag_type })
    if result and #result ~= 0 then return #result .. ' ' end
  end
end

function M.get_diagnostic_error()
  if not vim.tbl_isempty(lsp.get_clients({bufnr = 0})) then
    return get_nvim_lsp_diagnostic(diagnostic.severity.ERROR)
  end
  return ''
end

function M.get_diagnostic_warn()
  if not vim.tbl_isempty(lsp.get_clients({bufnr = 0})) then
    return get_nvim_lsp_diagnostic(diagnostic.severity.WARN)
  end
  return ''
end

function M.get_diagnostic_hint()
  if not vim.tbl_isempty(lsp.get_clients({bufnr = 0})) then
    return get_nvim_lsp_diagnostic(diagnostic.severity.HINT)
  end
  return ''
end

function M.get_diagnostic_info()
  if not vim.tbl_isempty(lsp.get_clients({bufnr = 0})) then
    return get_nvim_lsp_diagnostic(diagnostic.severity.INFO)
  end
  return ''
end

return M
