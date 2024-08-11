# User paths
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/Applications $fish_user_paths

# sets tools
set -x EDITOR nvim
set -x VISUAL nvim
set -x TERM kitty
# Sets the terminal type for proper colors
set TERM "xterm-256color"

# Suppresses fish's intro message
set fish_greeting

# Prevent directories names from being shortened
set fish_prompt_pwd_dir_length 0
set -x FZF_DEFAULT_OPTS "--color=16,header:13,info:5,pointer:3,marker:9,spinner:1,prompt:5,fg:7,hl:14,fg+:3,hl+:9 --inline-info --tiebreak=end,length --bind=shift-tab:toggle-down,tab:toggle-up"
# "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -g theme_nerd_fonts yes

# Yazi function
function yy 
  set tmp (mktemp -t "yazi-cwd.XXXXXX")
  yazi $argv --cwd-file="$tmp"
  if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
    cd "$cwd"
  end
  rm -f -- "$tmp"
end 

### FUNCTIONS ###
# Fish command history
function history
    builtin history --show-time='%F %T ' | sort
end


# recently installed packages
function ripp --argument length -d "List the last n (100) packages installed"
    if test -z $length
        set length 100
    end
    expac --timefmt='%Y-%m-%d %T' '%l\t%n' | sort | tail -n $length | nl
end

function ex --description "Extract bundled & compressed files"
    if test -f "$argv[1]"
        switch $argv[1]
            case '*.tar.bz2'
                tar xjf $argv[1]
            case '*.tar.gz'
                tar xzf $argv[1]
            case '*.bz2'
                bunzip2 $argv[1]
            case '*.rar'
                unrar $argv[1]
            case '*.gz'
                gunzip $argv[1]
            case '*.tar'
                tar xf $argv[1]
            case '*.tbz2'
                tar xjf $argv[1]
            case '*.tgz'
                tar xzf $argv[1]
            case '*.zip'
                unzip $argv[1]
            case '*.Z'
                uncompress $argv[1]
            case '*.7z'
                7z $argv[1]
            case '*.deb'
                ar $argv[1]
            case '*.tar.xz'
                tar xf $argv[1]
            case '*.tar.zst'
                tar xf $argv[1]
            case '*'
                echo "'$argv[1]' cannot be extracted via ex"
        end
   else
       echo "'$argv[1]' is not a valid file"
   end
end

function less
    command less -R $argv
end

# function cd
#     builtin cd $argv; and ls
# end

### ALIASES ###

#list
alias tree="eza --color=always --icons=always --tree"
alias ls="eza --color=always --icons=always"
alias la="eza -a --color=always --long  --no-filesize --icons=always --group-directories-first"
alias ll="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias xll="exa -lag --icons --color=always --group-directories-first --octal-permissions"
alias l="ls"
alias l.="ls -A | egrep '^\.'"
alias listdir="ls -d */ > list"

# show the list of packages that need this package - depends mpv as example
function function_depends
    set search $argv[1]
    sudo pacman -Sii $search | grep "Required" | sed -e "s/Required By     : //g" | sed -e "s/  /\n/g"
end

#fix obvious typo's
# alias cd..="cd .."
alias pdw="pwd"

#youtube download
alias yta-aac="yt-dlp --extract-audio --audio-format aac"
alias yta-best="yt-dlp --extract-audio --audio-format best"
alias yta-flac="yt-dlp --extract-audio --audio-format flac"
alias yta-mp3="yt-dlp --extract-audio --audio-format mp3"
alias ytv-best="yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4"

alias nlxdm="sudo $EDITOR /etc/lxdm/lxdm.conf"
alias nlightdm="sudo $EDITOR /etc/lightdm/lightdm.conf"
alias npacman="sudo $EDITOR /etc/pacman.conf"
alias ngrub="sudo $EDITOR /etc/default/grub"
alias nconfgrub="sudo $EDITOR /boot/grub/grub.cfg"
alias nmkinitcpio="sudo $EDITOR /etc/mkinitcpio.conf"
alias nmirrorlist="sudo $EDITOR /etc/pacman.d/mirrorlist"
alias narcomirrorlist="sudo $EDITOR /etc/pacman.d/arcolinux-mirrorlist"
alias nsddm="sudo $EDITOR /etc/sddm.conf"
alias nsddmk="sudo $EDITOR /etc/sddm.conf.d/kde_settings.conf"
alias nfstab="sudo $EDITOR /etc/fstab"
alias nnsswitch="sudo $EDITOR /etc/nsswitch.conf"
alias nsamba="sudo $EDITOR /etc/samba/smb.conf"
alias ngnupgconf="sudo $EDITOR /etc/pacman.d/gnupg/gpg.conf"
alias nhosts="sudo $EDITOR /etc/hosts"
alias nhostname="sudo $EDITOR /etc/hostname"
alias nresolv="sudo $EDITOR /etc/resolv.conf"
alias nb="$EDITOR ~/.bashrc"
alias nz="$EDITOR ~/.zshrc"
alias nf="$EDITOR ~/.config/fish/config.fish"
alias nplymouth="sudo $EDITOR /etc/plymouth/plymouthd.conf"
alias nvconsole="sudo $EDITOR /etc/vconsole.conf"

#git
alias rmgitcache="rm -r ~/.cache/git"
alias grh="git reset --hard"
alias gst="git status"
alias gaa="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"
alias gsw="git show"
alias glp="git log -p"
alias gssp="git stash show -p"
alias grp="git reflog -p"
alias gap="git add -p"

alias cat="bat"

#pamac
alias pamac-unlock="sudo rm /var/tmp/pamac/dbs/db.lock"

alias vim="nvim"
alias vim.="nvim ."
alias opvimfl="fzf --preview='bat --style=numbers --color=always {}'"
alias code.="code ."
alias icat="kitty +kitten icat"
alias cls="clear"
alias z..="z .."
# alias cd="z"
# alias cd..="z .."
# alias ffile="fzf --preview='bat --style=numbers --color=always {}'"

export FZF_DEFAULT_OPTS="--height=80% --layout=reverse --info=inline --preview 'bat --style=numbers --color=always {}' --border --margin=1 --padding=1"

# fd - cd to selected directory

# export PATH="/home/rafa/.scripts:$PATH"
# export PATH="/home/rafa/.flutter/flutter/bin:$PATH"
# export PATH="/home/rafa/.flutter/cmdline-tools/bin:$PATH"
# export PATH="/home/rafa/.flutter/bin:$PATH"
# export PATH="/home/rafa/.flutter/platform-tools:$PATH"
# export PATH="/home/rafa/.flutter/gradle/bin:$PATH"
# export CHROME_EXECUTABLE="/usr/bin/chromium"

fastfetch

set fish_color_autosuggestion "#969896"
set fish_color_cancel -r
set fish_color_command "#0782DE"
set fish_color_comment "#f0c674"
set fish_color_cwd "#008000"
set fish_color_cwd_root red
set fish_color_end "#b294bb"
set fish_color_error "#fb4934"
set fish_color_escape "#fe8019"
set fish_color_history_current --bold
set fish_color_host "#85AD82"
set fish_color_host_remote yellow
set fish_color_match --background=brblue
set fish_color_normal normal
set fish_color_operator "#fe8019"
set fish_color_param "#81a2be"
set fish_color_quote "#b8bb26"
set fish_color_redirection "#d3869b"
set fish_color_search_match bryellow background=brblack
set fish_color_selection white --bold background=brblack
set fish_color_status red
set fish_color_user brgreen
set fish_color_valid_path --underline
set fish_pager_color_completion normal
set fish_pager_color_description "#B3A06D" yellow
set fish_pager_color_prefix normal --bold underline
set fish_pager_color_prefix white --bold --underline
set fish_pager_color_progress brwhite --background=cyan
set fish_color_search_match --background="#60AEFF"

zoxide init fish | source
