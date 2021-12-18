function fish_prompt --description 'Write out the prompt'
  set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
  if [ $fish_key_bindings = fish_vi_key_bindings ]
    switch $fish_bind_mode
      case default
        echo -n "(n) "
      case insert
        echo -n "(i) "
      case visual
        echo -n "(v) "
      case replace-one
        echo -n "(r) "
    end
  end

  set_color white
  echo -n "λ" (prompt_pwd)/

  set -l git_branch (command git symbolic-ref --quiet --short HEAD 2> /dev/null)
  set -l git_commit (command git rev-parse --short HEAD 2> /dev/null)
  set -l git_dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)

  if test -n "$git_branch"; or test -n "$git_commit"
    set_color green

    if test -n "$git_branch"
      echo -n " $git_branch"
    else
      echo -n " $git_commit"
    end

    if test -n "$git_dirty"
      echo -n "*"
    end
  end

  set_color white
  echo -n " "
end
