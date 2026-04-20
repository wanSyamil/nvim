# my setup

- install nvim
- git clone this repo into ~/.config/nvim
- install kitty (terminal)
 kitty configs ~/.config/kitty
background_opacity 0.8
cursor_trail 1
cursor_trail_decay 0.1 0.4
cursor_trail_start_threshold 2
font_family 0xProto Nerd Font
- install lazygit
sudo dnf install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
sudo dnf install lazygit
- install inteliphense (lsp) through :Mason
- ~enable php through :LazyExtra~ buggy
- composer install (Laravel project require this for LSP to work)
