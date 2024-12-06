#!/bin/bash

CUR_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo $CUR_DIR

cat $CUR_DIR/symbols/ua-rev | sudo tee -a /usr/share/X11/xkb/symbols/ua > /dev/null

sudo sed -i -E 's/(! variant)/\1\n  colemak-rev    ua: Ukrainian (Colemak reverse)\n  graphite-rev    ua: Ukrainian (Graphite reverse)/g' /usr/share/X11/xkb/rules/evdev.lst

sudo awk -v cur_dir="$CUR_DIR" '
/<configItem>/ { in_ua=0 }
/<name>ua<\/name>/ { in_ua=1 }
in_ua && /<variantList>/ { print; system("cat " cur_dir "/rules/envdev.xml"); next }
{ print }
' /usr/share/X11/xkb/rules/evdev.xml > /tmp/evdev.xml

sudo rm -f /usr/share/X11/xkb/rules/evdev.xml
sudo mv /tmp/evdev.xml /usr/share/X11/xkb/rules/evdev.xml
