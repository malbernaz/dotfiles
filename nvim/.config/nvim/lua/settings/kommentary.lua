return function()
  local kmt = require("kommentary.config")

  kmt.use_extended_mappings()
  kmt.configure_language("default", { prefer_single_line_comments = true })
  kmt.configure_language("vue", {
    single_line_comment_string = "auto",
    multi_line_comment_strings = "auto",
    pre_comment_hook = function()
      require("ts_context_commentstring.internal").update_commentstring()
    end,
  })
end
