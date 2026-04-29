-- Make `gf` work on proto imports.
-- Imports look like: import "ai/h2o/mlops/foo.proto";
-- They're resolved relative to a proto root, typically <repo>/api/proto
-- (or <repo>/api in the mlops-deployment repo).

vim.opt_local.suffixesadd:append('.proto')

local function find_proto_root(start)
  local candidates = { 'api/proto', 'api' }
  local dir = vim.fs.dirname(start)
  while dir and dir ~= '/' do
    for _, sub in ipairs(candidates) do
      local p = dir .. '/' .. sub
      if vim.fn.isdirectory(p) == 1 then
        return p
      end
    end
    local parent = vim.fs.dirname(dir)
    if parent == dir then break end
    dir = parent
  end
end

local root = find_proto_root(vim.api.nvim_buf_get_name(0))
if root then
  vim.opt_local.path:append(root)
end

-- Well-known external proto roots (for imports like "google/api/annotations.proto")
local externals = {
  vim.fn.expand('~/repo/googleapis'),
}
for _, p in ipairs(externals) do
  if vim.fn.isdirectory(p) == 1 then
    vim.opt_local.path:append(p)
  end
end
