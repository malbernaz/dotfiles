local comment = require("Comment")

comment.setup({
  pre_hook = require("ts_context_commentstring.internal").calculate_commentstring,
})
