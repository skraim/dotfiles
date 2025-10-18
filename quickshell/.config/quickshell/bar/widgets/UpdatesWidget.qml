import qs.utils
import qs.services
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Item {
    Layout.fillWidth: true
    implicitHeight: icon_root.height

    Text {
        id: icon_root
        font.pointSize: 17
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Material Symbols Rounded"
        text: Icons.updates
        color: Pywal.colors.color2
    }

    Counter {
        text: Updates.count.toString()
        visible: Updates.count > 0
    }
}
