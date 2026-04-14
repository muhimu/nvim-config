return {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>e', '<cmd>Yazi<cr>', desc = 'Open Yazi (current file)' },
    { '<leader>E', '<cmd>Yazi cwd<cr>', desc = 'Open Yazi (cwd)' },
  },
  opts = {
    open_for_directories = true,
  },
}
