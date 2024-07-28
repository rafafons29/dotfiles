return {
  'kevinhwang91/nvim-ufo',
  dependencies = {'kevinhwang91/promise-async'},
  lazy = true,
  opts = function()
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = ('  %d '):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, 'MoreMsg' })
      return newVirtText
    end

    local ftMap = {
      vim = 'indent',
      python = { 'indent' },
      git = ''
    }

    return {
      fold_virt_text_handler = handler,
      open_fold_hl_timeout = 150,
      close_fold_kinds_for_ft = {
        default = { 'imports', 'comment' },
        json = { 'array' },
        c = { 'comment', 'region' }
      },
      preview = {
        win_config = {
          border = { '', '─', '', '', '', '─', '', '' },
          winhighlight = 'Normal:Folded',
          winblend = 0
        },
        mappings = {
          scrollU = '<C-u>',
          scrollD = '<C-d>',
          jumpTop = '[',
          jumpBot = ']'
        }
      },
      provider_selector = function(bufnr, filetype, buftype)
        return ftMap[filetype] or {'treesitter', 'indent'}
      end
    }
  end,
  keys = {
    { 'zR', function() require('ufo').openAllFolds() end, desc = 'Open all folds' },
    { 'zM', function() require('ufo').closeAllFolds() end, desc = 'Close all folds' },
    { 'zr', function() require('ufo').openFoldsExceptKinds() end, desc = 'Open folds except kinds' },
    { 'zm', function() require('ufo').closeFoldsWith() end, desc = 'Close folds with' },
    { 'K', function()
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        vim.fn.CocActionAsync('definitionHover') -- coc.nvim
        vim.lsp.buf.hover()
      end
    end, desc = 'Peek folded lines under cursor or show hover' },
  },
}
