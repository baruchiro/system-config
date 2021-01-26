#!/bin/bash

# See docs https://github.com/tprasadtp/ubuntu-post-install

cd "$(dirname "$0")"

after_effect_version="v6.3.0"

wget "https://github.com/tprasadtp/ubuntu-post-install/releases/download/${after_effect_version}/after-effects" -O after-effects
wget "https://github.com/tprasadtp/ubuntu-post-install/releases/download/${after_effect_version}/sha256sums.txt" -O sha256sums.txt
sha256sum -c sha256sums.txt --strict

chmod +x after-effects
sudo ./after-effects --config-file config.yml --autopilot

## More installs

# oh-my-bash
sh -c "$(wget https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"

# JetBrainsMono NF
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
sudo unzip JetBrainsMono.zip -d /usr/share/fonts && fc-cache -f -v || echo "########## ERROR JetBrainsMono ###########"
# In VSCode you may restart the computer, then set the font to 'JetBrainsMono NF', 'Courier New', monospace
# Also set "editor.fontLigatures": true
