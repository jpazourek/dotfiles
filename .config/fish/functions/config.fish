function config --wraps='git --git-dir=/home/pazy/.dotfiles --work-tree=/home/pazy' --description 'alias config=git --git-dir=/home/pazy/.dotfiles --work-tree=/home/pazy'
    git --git-dir=/home/pazy/.dotfiles --work-tree=/home/pazy $argv
end
