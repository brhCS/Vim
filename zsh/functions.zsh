# Ask user to confirm command execution
confirm() {
    cmd="$1"
    msg="$2"
    if [ -n "$msg" ]; then
        echo "$msg"
    else
        echo "Would you like to run: $cmd"
    fi
    read -n "resp?Proceed? [y/N] "
    if [[ $resp =~ ^[Yy]$ ]]; then
        eval "$cmd"
    fi
}

# Optionally print a msg, then ask the user if he'd like to continue or abort
proceed() {
    if [ -n "$1" ]; then
        echo "$1"
    fi
    read -n "resp?Would you like to continue? [y/N] "
    if ! [[ $resp =~ ^[Yy]$ ]]; then
        exit 1
    fi
}

# Removes "<none>" containers
docker-rmi-anon() {
    docker images | grep "<none>" | awk '{print $3}' | xargs -I{} docker rmi -f {}
}

em() {
    if [ -f /tmp/emacs$UID/server ]; then
        emacsclient "$@"
        return
    fi

    mkdir -p /tmp/emacs$UID && pushd /tmp/emacs$UID
    nohup emacs "$@" &
    popd
}

check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]; then
    local EXIT_CODE_PROMPT=' '
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE%{$reset_color%}"
    EXIT_CODE_PROMPT+="%{$fg[red]%}-%{$reset_color%} "
    echo "$EXIT_CODE_PROMPT"
  fi
}

set-proxy() {
    export http{,s}_proxy=$1
    export HTTP{,S}_PROXY=$1
    export ftp{,s}_proxy=$1
}

unproxy() {
    unset FTP{,S}_PROXY
    unset ftp{,s}_proxy
    unset HTTP{,S}_PROXY
    unset http{,s}_proxy
    echo "Unset all proxies"
}

vimify() {
    (vim - -esbnN -c "$*" -c 'w!/dev/fd/3|q!' >/dev/null) 3>&1
}

resize() {
    file="$1"
    dimensions="800x800"
    if [ $# -eq 2 ]; then
        dimensions="$2"
    fi

    convert "$file" -resize "$dimensions" "$1"
}

#  ============================================================================
#                                   FZF
#  ============================================================================
#  Useful functions from https://github.com/junegunn/fzf/wiki/examples
#
# fh - repeat history. This function only works in zsh
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
    local out file key
    IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
    key=$(head -1 <<< "$out")
    file=$(head -2 <<< "$out" | tail -1)
    if [ -n "$file" ]; then
        [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
    fi
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbrr - checkout git branch (including remote branches)
fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fco() {
  local branches target
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$branches") |
    fzf --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fcoc - checkout git commit
fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]; then
        echo $pid | xargs kill -${1:-9}
    fi
}

# fshow - git commit browser
fshow() {
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
        fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
            --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

# Get the foo/bar part of https://github.com/foo/bar.git or git@github.com:foo/bar.git
git-remote() {
    REMOTE=${1-origin}
    rmt=$(git remote get-url "$REMOTE" \
              | grep -Eo "([_A-Za-z0-9-]+\/[_A-Za-z0-9-]+(.git)?$)" \
              | sed 's/\.git$//')
    if [[ $? -ne 0 ]]; then
        echo "Failed to get owner/repo from $REMOTE"
        exit 1
    else
        echo "$rmt"
    fi
}

# Get the github.com part of http://github.com/foo/bar.git or git@github.com:foo/bar.git
git-site() {
    REMOTE=${1-origin}
    git remote get-url "$REMOTE" \
              | sed -e 's|^https://||' -e 's|^git@||' -e 's|\.git$||' -e 's|[:/].*||'
}

_git_swapper() {
    repo=$(git-remote "$1")
    git remote set-url "$1" "${2}${repo}.git"
    echo "Set remote $REMOTE to $(git remote get-url $REMOTE)"
}

git-ssh-to-https() {
    site=$(git-site "$1")
    echo "Setting $1 to https on $site"
    _git_swapper "$1" "https://$site/"
}

git-https-to-ssh() {
    site=$(git-site "$1")
    echo "Setting $1 to ssh on $site"
    _git_swapper "$1" "git@$site:"
}

# Swap between HTTPS and SSH, optionally specifying which remote.
git-remote-swap-protocol() {
    REMOTE=${1-origin}
    git remote get-url "$REMOTE" | grep "https" > /dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        git-https-to-ssh "$REMOTE"
    else
        git-ssh-to-https "$REMOTE"
    fi
}
