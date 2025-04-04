#!/usr/bin/env bash

mv ~/.config/alacritty/ ~/.config/alacritty-old/
mv ~/.config/fastfetch/ ~/.config/fastfetch-old/
mv ~/.config/hypr/ ~/.config/hypr-old/
mv ~/.config/wofi/ ~/.config/wofi-old/

cp -r alacritty/* ~/.config/alacritty/
cp -r fastfetch/* ~/.config/fastfetch/
cp -r hypr/* ~/.config/hypr/
cp -r wofi/* ~/.config/wofi/

