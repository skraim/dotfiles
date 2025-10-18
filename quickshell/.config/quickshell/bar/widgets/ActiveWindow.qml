import qs.utils
import QtQuick

Item {
    id: root
    required property var appName
    visible: appName && appName != "undefined"
    implicitWidth: active_window.height
    implicitHeight: active_window.width

    Text {
        id: active_window
        font.pointSize: 14
        font.weight: 600
        font.letterSpacing: 1.1
        rotation: 270
        anchors.centerIn: parent
        text: appName
        style: Text.Raised
        color: Pywal.colors.color2
    }
}
