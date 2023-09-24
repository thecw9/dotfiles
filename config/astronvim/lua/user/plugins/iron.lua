return function()
  local iron = require "iron.core"
  local view = require "iron.view"

  iron.setup {
    config = {
      should_map_plug = false,
      scratch_repl = true,
      repl_definition = {
        python = {
          command = { "ipython" },
          format = require("iron.fts.common").bracketed_paste,
        },
      },
      -- repl_open_cmd = view.split.vertical.botright(0.4),
      repl_open_cmd = view.split "40%",
    },
    keymaps = {
      -- send_motion = "<space>sc",
      --visual_send = "<space>sc",
      visual_send = "<enter>",
      -- send_file = "<space>sf",
      -- send_line = "<space>sl",
      -- send_mark = "<space>sm",
      -- mark_motion = "<space>mc",
      -- mark_visual = "<space>mc",
      -- remove_mark = "<space>md",
      -- cr = "<space>s<cr>",
      -- interrupt = "<space>s<space>",
      -- exit = "<space>sq",
      -- clear = "<space>sc",
    },
  }
end
