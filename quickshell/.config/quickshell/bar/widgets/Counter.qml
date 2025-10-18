import qs.utils
import QtQuick
import Quickshell.Widgets

ClippingWrapperRectangle {
    id: root
    property int text
    color: Pywal.colors.color4
    implicitWidth: counter.implicitWidth + 7
    height: 13
    radius: 10

    anchors {
        top: icon_root.top
        right: icon_root.right
        topMargin: -1
        rightMargin: -5
    }
    z: 1

    Text {
        id: counter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        lineHeight: 0.5
        text: root.text
        color: Pywal.colors.color0
        font.pointSize: 9
        font.weight: 700
        font.family: "MesloLGL Nerd Font Mono"
    }
}
