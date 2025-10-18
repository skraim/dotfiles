import qs.utils
import qs.services
import QtQuick
import QtQuick.Layouts

Item {
    implicitHeight: icon_root.height
    Layout.fillWidth: true

    Text {
        id: icon_root
        font.pointSize: 17
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Material Symbols Rounded"
        text: Notifications.icon
        color: Pywal.colors.color2
    }

    Counter {
        text: Notifications.count
        visible: Notifications.count > 0
    }
}
