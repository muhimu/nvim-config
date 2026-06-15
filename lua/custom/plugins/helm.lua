-- Filetype detection for Helm charts. Sets `filetype=helm` on chart templates,
-- values.yaml, and Chart.yaml so the `helm_ls` language server (configured in
-- init.lua) attaches. Without this, helm_ls never triggers.
return {
  'towolf/vim-helm',
  ft = { 'helm', 'yaml' },
}
