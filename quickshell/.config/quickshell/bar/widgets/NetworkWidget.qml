import qs.utils
import qs.services
import QtQuick
import QtQuick.Layouts

Item {
    visible: !Network.ethernet
    Layout.fillWidth: true
    implicitHeight: icon_root.height

    Text {
        id: icon_root
        font.pointSize: 19
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Material Symbols Rounded"
        text: Icons.getNetworkIcon()
        color: Pywal.colors.color2
    }
}
