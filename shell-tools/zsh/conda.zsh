# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/riczzoe/.miniforge/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/riczzoe/.miniforge/etc/profile.d/conda.sh" ]; then
        . "/home/riczzoe/.miniforge/etc/profile.d/conda.sh"
    else
        export PATH="/home/riczzoe/.miniforge/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/riczzoe/.miniforge/etc/profile.d/mamba.sh" ]; then
    . "/home/riczzoe/.miniforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

