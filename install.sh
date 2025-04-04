#!/usr/bin/env bash

mv ~/.config/hypr/ ~/.config/hypr-old/
mv ~/.config/fastfetch/ ~/.config/fastfetch-old/

cp -r hypr/* ~/.config/hypr/
cp -r fastfetch/* ~/.config/fastfetch/

