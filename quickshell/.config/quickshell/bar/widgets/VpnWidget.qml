import qs.utils
import qs.services
import QtQuick
import QtQuick.Layouts

Item {
    visible: Network.vpnConnected
    Layout.fillWidth: true
    Layout.topMargin: -6
    implicitHeight: icon_root.height

    Text {
        id: icon_root
        font.pointSize: 19
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Material Symbols Rounded"
        text: "vpn_key"
        color: Pywal.colors.color6
    }
}
