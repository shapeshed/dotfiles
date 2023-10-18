# An option to record the history_id of the most recent buffer write
declare-option -hidden int last_state_save_history_id 0

# An option to record the buffer's selection state.
declare-option -hidden str last_state_save_selection 1.1,1.1

# An option to control where selection states are saved.
declare-option \
    -docstring "Where the state-save plugin saves buffer state" \
    str \
    state_save_path \
%sh{
    printf "%s\n" "${XDG_DATA_HOME:-$HOME/.local/share/}/kak/state-save/"
}

# An option to exclude particular files from having their state saved.
# By default we ignore Kakoune scratch buffers and git commit messages.
declare-option \
    -docstring "Globs that match files whose state should not be saved." \
    str-list \
    state_save_exclude_globs \
    '*/COMMIT_EDITMSG'

define-command \
    -params 1 \
    -docstring "
        state-save-reg-load <regname>

        Load the named register from disk.
        The colon, slash, and pipe registers will merge the new contents rather
        than replacing the old.
        " \
    state-save-reg-load \
%{
    evaluate-commands %sh{
        # If the requested register file exists...
        if [ -f "$kak_opt_state_save_path/$1.register" ]; then
            # ...read it into the named register.
            printf "%s\n" "eval reg $1 %file{$kak_opt_state_save_path/$1.register}"
        fi
    }
}

define-command \
    -params 1 \
    -docstring "
        state-save-reg-save <regname>

        Store the named register to disk.
        " \
    state-save-reg-save \
%{
    # ...ensure the state-save directory exists
    nop %sh{ mkdir -p "$kak_opt_state_save_path" }

    # Write out the command history for next time.
    #echo -debug \
    evaluate-commands echo \
        -to-file "%opt{state_save_path}/%arg{1}.register" \
        -quoting kakoune \
        -- \
        "%%reg{%arg{1}}"
}

# When a window is created for a buffer...
hook global WinCreate .* %{
    # ...set the initial history ID for that buffer.
    # It's probably zero, but it doesn't hurt to be sure.
    set-option buffer last_state_save_history_id %val{history_id}

    # The first time the window is actually displayed (WinDisplay is the only
    # window-related hook not executed in a draft context)...
    hook -once window WinDisplay .* %{
        evaluate-commands %sh{
            # Do we care about the state of this file?
            eval set -- "$kak_opt_state_save_exclude_globs"
            while [ $# -gt 0 ]; do
                # If our buffer name matches one of the exclude globs, exit.
                case "$kak_buffile" in ($1) exit ;; esac
                shift
            done

            # Figure out what file we stored the selection state in.
            state_file=$(printf "%s" "$kak_buffile" | sed -e 's|_|__|g' -e 's|/|_-|g')
            #echo "echo -debug loading state for $kak_buffile from $state_file"

            # If we have stored state...
            if [ -f "$kak_opt_state_save_path"/"$state_file" ]; then
                #printf "echo -debug select "; head -n 1 "$kak_opt_state_save_path"/"$state_file"

                # ...then use that state in a select command.
                # (we use head rather than cat so extra lines in the file don't get
                # executed by Kakoune)
                printf "select "; head -n 1 "$kak_opt_state_save_path"/"$state_file"
                # Centre the viewport on the active selection.
                printf "%s\n" "execute-keys vv"
            fi
        }

        # If theer's any other plugin that cares about the scroll position,
        # let them know it's changed.
        trigger-user-hook ScrollEnd
    }

    # Whenever we have a spare moment in this window...
    hook window NormalIdle .* %{ evaluate-commands %sh{
        #echo "echo -debug current history id: $kak_history_id"
        #echo "echo -debug last saved history id: $kak_opt_last_state_save_history_id"

        # ...if the buffer has not been modified since it was last saved...
        if [ "$kak_history_id" = "$kak_opt_last_state_save_history_id" ]; then
            # ...remember the current selection state of the buffer.
            printf "%s\n" "set-option buffer last_state_save_selection '$kak_selections_desc'"
        fi
    }}

    # Whenever the buffer is saved...
    hook window BufWritePost .* %{
        # ...record that the current history ID has been saved.
        set-option buffer last_state_save_history_id %val{history_id}
        # ...and remember the current selection state. If this BufWritePost was
        # triggered by a :wq, we might not get another NormalIdle event before
        # the window is closed, and we want to make sure we have the correct
        # selection state.
        set-option buffer last_state_save_selection "%val{selections_desc}"
    }

    # Whenever the buffer is closed...
    hook window WinClose .* %{ evaluate-commands %sh{
        # Do we care about the state of this file?
        eval set -- "$kak_opt_state_save_exclude_globs"
        while [ $# -gt 0 ]; do
            # If our buffer name matches one of the exclude globs, exit.
            case "$kak_buffile" in ($1) exit ;; esac
            shift
        done

        # ...ensure the state-save directory exists
        mkdir -p "$kak_opt_state_save_path"
        # If this buffer does not represent an existing file, we don't need to
        # save the state.
        test -f "$kak_buffile" || exit
        # Figure out what file we should store the selection state in.
        state_file=$(printf "%s" "$kak_buffile" | sed -e 's|_|__|g' -e 's|/|_-|g')
        #echo "echo -debug saving state for $kak_buffile to $state_file: $kak_selections_desc"
        # Write the saved selection state to that file.
        printf "%s\n" "$kak_opt_last_state_save_selection" \
            > "$kak_opt_state_save_path"/"$state_file"
    }}
}
