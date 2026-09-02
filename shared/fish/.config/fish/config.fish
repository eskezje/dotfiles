if status is-interactive
    # Commands to run in interactive sessions can go here
end

# function fish_greeting
#     echo Hello friend!
#     echo The time is (set_color yellow)(date +%T)(set_color --reset) and this machine is called $hostname
# end

set -g fish_prompt_pwd_dir_length 0
# set -gx SHELL /opt/homebrew/bin/fish

if test -f ~/anaconda3/etc/fish/conf.d/conda.fish
    source ~/anaconda3/etc/fish/conf.d/conda.fish
end
