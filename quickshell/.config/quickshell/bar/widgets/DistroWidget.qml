import qs.utils
import qs.common
import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets

Item {
    Layout.topMargin: 7
    Layout.bottomMargin: -17
    Layout.alignment: Qt.AlignCenter
    implicitHeight: distro_icon.height
    implicitWidth: distro_icon.width

    Text {
        id: distro_icon
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 35
        font.family: "MesloLGL Nerd Font Mono"
        text: Icons.arch.icon
        color: Icons.arch.color
    }
}
