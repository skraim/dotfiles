import qs.utils
import qs.services
import QtQuick
import QtQuick.Layouts

Item {
    Layout.fillWidth: true
    implicitHeight: icon_root.height

    Text {
        id: icon_root
        font.pointSize: 17
        anchors.horizontalCenter: parent.horizontalCenter
        font.family: "Material Symbols Rounded"
        text: Bluetooth.bluetoothEnabled
            ? Bluetooth.bluetoothConnectedCount > 0
                ? "bluetooth_connected"
                : "bluetooth"
            : "bluetooth_disabled"
        color: Pywal.colors.color2
    }

    Counter {
        text: Bluetooth.bluetoothConnectedCount
        visible: Bluetooth.bluetoothConnectedCount > 0
    }
}
