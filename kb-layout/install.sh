#!/bin/sh

sudo rm -f /usr/share/X11/xkb/symbols/uk-rev
sudo cp symbols/* /usr/share/X11/xkb/symbols/

sudo sed -i -E 's/\s*uk-rev.*//g' /usr/share/X11/xkb/rules/evdev.lst
sudo sed -i -E 's/(! layout)/\1\n  uk-rev         Ukrainian (Reverse)/g' /usr/share/X11/xkb/rules/evdev.lst
sudo sed -i -E 's/(! variant)/\1\n  uk-colemak-rev    uk-rev: Ukrainian (Colemak reverse)\n  uk-graphite-rev    uk-rev: Ukrainian (Graphite reverse)/g' /usr/share/X11/xkb/rules/evdev.lst

sudo awk '/<\/layoutList>/ { system ( "cat ./rules/envdev.xml" ) } { print; }' /usr/share/X11/xkb/rules/evdev.xml >> /tmp/evdev.xml
sudo rm -f /usr/share/X11/xkb/rules/evdev.xml
sudo mv /tmp/evdev.xml /usr/share/X11/xkb/rules/evdev.xml
