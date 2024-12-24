function fish_prompt --description 'Write out the prompt'
    if [ $fish_key_bindings = fish_vi_key_bindings ]
        set_color $fish_color_autosuggestion
        echo -n "("
        switch $fish_bind_mode
            case default
                set_color green
                echo -n n
            case insert
                set_color cyan
                echo -n i
            case visual
                set_color magenta
                echo -n v
            case replace
                set_color red
                echo -n r
            case replace_one
                set_color red
                echo -n r
        end
        set_color $fish_color_autosuggestion
        echo -n ") "
    end

    set_color white
    echo -n λ (prompt_pwd)

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
