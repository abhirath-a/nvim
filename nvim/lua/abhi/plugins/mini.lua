return {
  {
    'mini.ai',
    after = function()
      require('mini.ai').setup()
    end,
  },
  {
    'mini.icons',
    after = function()
      require('mini.icons').setup()
    end,
    dep_of = { 'mini.pick', 'oil' },
  },
  {
    'mini.pairs',
    event = 'InsertEnter',
    after = function()
      require('mini.pairs').setup()
      vim.ui.select = require('mini.pick').ui_select
    end,
  },
  {
    'mini.pick',
    cmd = 'Pick',
    keys = {
      {
        '<C-p>',
        '<cmd>Pick files<CR>',
      },
      {
        '<leader>fg',
        '<cmd>Pick grep_live<CR>',
      },
      {
        '<leader>fb',
        '<cmd>Pick buffers<CR>',
      },
      {
        '<leader>fc',
        '<cmd>Pick git_commits<CR>',
      },
      {
        '<leader>fw',
        '<cmd>Pick diagnostic<CR>',
      },
    },
    after = function()
      require('mini.pick').setup()
    end,
  },
  {
    'mini.extra',
    dep_of = 'mini.pick',
    after = function()
      require('mini.extra').setup()
    end,
  },
}
