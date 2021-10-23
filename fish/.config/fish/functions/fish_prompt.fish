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

  set -l git_branch (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
  set -l git_dirty (command git status -s --ignore-submodules=dirty 2> /dev/null)
  if test -n "$git_branch"
    set_color green
    echo -n " $git_branch"
    if test -n "$git_dirty"
      echo -n "*"
    end
  end

  set_color white
  echo -n " "
end