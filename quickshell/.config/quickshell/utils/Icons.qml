pragma Singleton

import qs.services
import Quickshell
import Quickshell.Services.UPower
import Quickshell.Services.Pipewire

Singleton {
    readonly property var arch: ({
            "icon": "",
            "color": "#1793d1"
        })

    readonly property string updates: "system_update_alt"

    readonly property var weatherIcons: ({
            "113": "clear_day",
            "116": "partly_cloudy_day",
            "119": "cloud",
            "122": "cloud",
            "143": "foggy",
            "176": "rainy",
            "179": "rainy",
            "182": "rainy",
            "185": "rainy",
            "200": "thunderstorm",
            "227": "cloudy_snowing",
            "230": "snowing_heavy",
            "248": "foggy",
            "260": "foggy",
            "263": "rainy",
            "266": "rainy",
            "281": "rainy",
            "284": "rainy",
            "293": "rainy",
            "296": "rainy",
            "299": "rainy",
            "302": "weather_hail",
            "305": "rainy",
            "308": "weather_hail",
            "311": "rainy",
            "314": "rainy",
            "317": "rainy",
            "320": "cloudy_snowing",
            "323": "cloudy_snowing",
            "326": "cloudy_snowing",
            "329": "snowing_heavy",
            "332": "snowing_heavy",
            "335": "snowing",
            "338": "snowing_heavy",
            "350": "rainy",
            "353": "rainy",
            "356": "rainy",
            "359": "weather_hail",
            "362": "rainy",
            "365": "rainy",
            "368": "cloudy_snowing",
            "371": "snowing",
            "374": "rainy",
            "377": "rainy",
            "386": "thunderstorm",
            "389": "thunderstorm",
            "392": "thunderstorm",
            "395": "snowing"
        })

    readonly property var notificationIcons: ({
            "default": "notifications",
            "dnd": "notifications_paused"
        })

    readonly property var kbLayoutIcons: ({
            "Ukrainian": "🇺🇦Q",
            "Ukrainian (Graphite reverse)": "🇺🇦",
            "English (US)": "🇺🇸"
        })
    property var substitutions: ({
            "code-url-handler": "visual-studio-code",
            "Code": "visual-studio-code",
            "gnome-tweaks": "org.gnome.tweaks",
            "pavucontrol-qt": "pavucontrol",
            "wps": "wps-office2019-kprometheus",
            "wpsoffice": "wps-office2019-kprometheus",
            "footclient": "foot",
            "zen": "zen-browser",
            "brave-browser": "brave-desktop"
        })

    function getKbLayoutIcon(language: string): string {
        if (kbLayoutIcons.hasOwnProperty(language))
            return kbLayoutIcons[language];
        return "❔";
    }

    function getBluetoothIcon(icon: string): string {
        if (icon.includes("headset") || icon.includes("headphones"))
            return "headphones";
        if (icon.includes("audio"))
            return "speaker";
        if (icon.includes("phone"))
            return "smartphone";
        if (icon.includes("mouse"))
            return "mouse";
        if (icon.includes("keyboard"))
            return "keyboard";
        return "bluetooth";
    }

    function getWeatherIcon(code: string): string {
        if (weatherIcons.hasOwnProperty(code))
            return weatherIcons[code];
        return "air";
    }

    function getNotificationIcon(icon: string): string {
        if (notificationIcons.hasOwnProperty(icon))
            return notificationIcons[icon];
        return "notifications";
    }

    function getBatteryStateIcon(state: var): string {
        if (state == UPowerDeviceState.Charging)
            return "bolt";
        if (state == UPowerDeviceState.Charging)
            return "power";
        return "";
    }

    function getBatteryIcon(percentage: real): string {
        if (percentage <= 0.1)
            return "battery_0_bar";
        if (percentage <= 0.2)
            return "battery_1_bar";
        if (percentage <= 0.3)
            return "battery_2_bar";
        if (percentage <= 0.5)
            return "battery_3_bar";
        if (percentage <= 0.7)
            return "battery_4_bar";
        if (percentage <= 0.8)
            return "battery_5_bar";
        if (percentage <= 0.9)
            return "battery_6_bar";
        return "battery_full";
    }

    function getAudioSinkIcon(isBluetooth: bool, node: PwNode): string {
        if (isBluetooth) {
            return node?.audio?.muted ? "headset_off" : "headset_mic";
        }

        if (node?.audio?.muted)
            return "volume_off";
        if (node?.audio?.volume > .5)
            return "volume_up";
        if (node?.audio?.volume <= .5)
            return "volume_down";
        return "";
    }

    function getNetworkIcon(): string {
        return Network.ethernet
            ? "lan"
            : (Network.networkName.length > 0 && Network.networkName != "lo")
                ? (Network.networkStrength > 80
                    ? "signal_wifi_4_bar"
                    : Network.networkStrength > 60
                        ? "network_wifi_3_bar"
                        : Network.networkStrength > 40
                            ? "network_wifi_2_bar"
                            : Network.networkStrength > 20
                                ? "network_wifi_1_bar"
                                : "signal_wifi_0_bar")
                : "signal_wifi_off";
    }
}
