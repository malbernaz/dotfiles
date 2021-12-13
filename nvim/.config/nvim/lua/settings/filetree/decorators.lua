local git = require("yanil/git")

local function git_status(node)
  if not node.parent then
    return
  end

  local git_icon, git_hl = git.get_icon_and_hl(node.abs_path)
  git_icon = git_icon or " "
  return " " .. git_icon, git_hl
end

return git_status
