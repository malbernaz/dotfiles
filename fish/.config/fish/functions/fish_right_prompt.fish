function fish_right_prompt
  set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
  if [ $fish_key_bindings = fish_vi_key_bindings ]
    switch $fish_bind_mode
      case default
        echo -n "[N]"
      case insert
        echo -n "[I]"
      case visual
        echo -n "[V]"
      case replace-one
        echo -n "[R]"
    end
  end
end
