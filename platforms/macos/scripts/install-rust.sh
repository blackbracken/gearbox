#!/usr/bin/env fish

if ! type cargo > /dev/null 2>&1
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
end

if ! contains $HOME/.cargo/bin $fish_user_paths
  set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
end

rustup install nightly
rustup default nightly
