function envsource --description 'Load environment variables from .env file'
    for line in (cat .env)
        # Skip comments and empty lines
        if test -n "$line" -a (string sub -l 1 "$line") != "#"
            set -l kv (string split -m 1 = $line)
            set -gx (string trim $kv[1]) (string trim $kv[2])
        end
    end
end
