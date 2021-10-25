#!/usr/bin/env fish

if ! type cs > /dev/null 2>&1
  brew install coursier/formulas/coursier
end

if ! contains $HOME/Library/Application\ Support/Coursier/bin $fish_user_paths
  set -U fish_user_paths $HOME/Library/Application\ Support/Coursier/bin $fish_user_paths
end

yes n | cs setup
