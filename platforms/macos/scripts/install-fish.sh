#!/usr/bin/env bash
set -eu

cd `dirname $0`
cd ../

FILE_SHELLS="/etc/shells"

if ! type fish > /dev/null 2>&1; then
  brew install fish
  fish -c "set -U fish_color_normal normal; \
    set -U fish_color_command b294bb; \
    set -U fish_color_quote b5bd68; \
    set -U fish_color_redirection 8abeb7; \
    set -U fish_color_end b294bb; \
    set -U fish_color_error cc6666; \
    set -U fish_color_param 81a2be; \
    set -U fish_color_comment f0c674; \
    set -U fish_color_match --background=brblue; \
    set -U fish_color_selection white --bold --background=brblack; \
    set -U fish_color_search_match bryellow --background=brblack; \
    set -U fish_color_history_current --bold; \
    set -U fish_color_operator 00a6b2; \
    set -U fish_color_escape 00a6b2; \
    set -U fish_color_cwd green; \
    set -U fish_color_cwd_root red; \
    set -U fish_color_valid_path --underline; \
    set -U fish_color_autosuggestion 969896; \
    set -U fish_color_user brgreen; \
    set -U fish_color_host normal; \
    set -U fish_color_cancel -r; \
    set -U fish_pager_color_completion normal; \
    set -U fish_pager_color_description B3A06D yellow; \
    set -U fish_pager_color_prefix normal -bold --underline; \
    set -U fish_pager_color_progress brwhite --background=cyan"
fi

if [ ! "$(cat ${FILE_SHELLS} | grep `which fish`)" ]; then
  echo `which fish` | sudo tee -a ${FILE_SHELLS} > /dev/null

fi

if [ `which fish` != "${SHELL}" ]; then
  chsh -s `which fish`
fi

if fish -c "fisher" > /dev/null 2>&1; then
  fish -c "fisher update"
else
  fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
fi

plugins=(
    "oh-my-fish/theme-bobthefish"
    "jethrokuan/z"
)
for plugin in ${plugins[@]}; do
    fish -c "fisher install $plugin"
done

mkdir -p $HOME/.config/fish
rm -f $HOME/.config/fish/config.fish
ln -sf `pwd`/config/fish/config.fish $HOME/.config/fish/config.fish
