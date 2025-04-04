#!/usr/bin/env bash

mv ~/.config/alacritty/ ~/.config/alacritty-old/
mv ~/.config/fastfetch/ ~/.config/fastfetch-old/
mv ~/.config/hypr/ ~/.config/hypr-old/
mv ~/.config/wofi/ ~/.config/wofi-old/

cp alacritty/* ~/.config/alacritty/
cp fastfetch/* ~/.config/fastfetch/
cp hypr/* ~/.config/hypr/
cp wofi/* ~/.config/wofi/

