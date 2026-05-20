return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'fredrikaverpil/neotest-golang',
  },
  keys = {
    { '<leader>Tt', function() require('neotest').run.run() end, desc = '[T]est nearest' },
    { '<leader>Tf', function() require('neotest').run.run(vim.fn.expand '%') end, desc = '[T]est [f]ile' },
    { '<leader>Ta', function() require('neotest').run.run(vim.uv.cwd()) end, desc = '[T]est [a]ll (cwd)' },
    { '<leader>Tl', function() require('neotest').run.run_last() end, desc = '[T]est [l]ast' },
    { '<leader>Ts', function() require('neotest').summary.toggle() end, desc = '[T]est [s]ummary panel' },
    { '<leader>To', function() require('neotest').output.open { enter = true, auto_close = true } end, desc = '[T]est [o]utput' },
    { '<leader>TO', function() require('neotest').output_panel.toggle() end, desc = '[T]est [O]utput panel' },
    { '<leader>TS', function() require('neotest').run.stop() end, desc = '[T]est [S]top' },
    { '[t', function() require('neotest').jump.prev { status = 'failed' } end, desc = 'Prev failed test' },
    { ']t', function() require('neotest').jump.next { status = 'failed' } end, desc = 'Next failed test' },
  },
  config = function()
    require('neotest').setup {
      adapters = {
        require 'neotest-golang' {},
      },
    }
  end,
}
