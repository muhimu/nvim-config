-- Filetype detection for Helm charts. Sets `filetype=helm` on chart templates,
-- values.yaml, and Chart.yaml so the `helm_ls` language server (configured in
-- init.lua) attaches. Without this, helm_ls never triggers.
return {
  'towolf/vim-helm',
  ft = { 'helm', 'yaml' },

  -- Some chart .tpl files carry a `{{/* vim: set filetype=mustache: */}}`
  -- modeline (a stale pre-helm-ls convention that just gave mustache syntax
  -- highlighting). It forces filetype=mustache, which beats vim-helm's
  -- detection and stops helm_ls from attaching ("no clients"). Re-assert
  -- filetype=helm for any file under a `templates/` dir after modelines have
  -- run. Registered in `init` (eager) because the modeline can prevent the
  -- plugin's own `ft` trigger from ever firing for that buffer.
  init = function()
    vim.api.nvim_create_autocmd('BufWinEnter', {
      group = vim.api.nvim_create_augroup('helm-tpl-modeline-fix', { clear = true }),
      pattern = { '*.tpl', '*.yaml', '*.yml' },
      callback = function(args)
        local name = vim.api.nvim_buf_get_name(args.buf)
        -- Only chart template files, and only when a modeline (or anything
        -- else) has knocked the filetype off `helm`.
        if name:find('/templates/', 1, true) and vim.bo[args.buf].filetype ~= 'helm' then vim.bo[args.buf].filetype = 'helm' end
      end,
    })
  end,
}
