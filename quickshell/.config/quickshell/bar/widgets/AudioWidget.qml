import qs.utils
import qs.services
import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: 0
    Layout.fillWidth: true
    Layout.fillHeight: true
    Layout.alignment: Qt.AlignHCenter

    Item {
        id: sink_item
        implicitHeight: icon.height
        implicitWidth: icon.width
        property bool isBluetooth: !!Audio.sink?.name?.startsWith("bluez")

        Text {
            id: icon
            font.pointSize: 17
            font.family: "Material Symbols Rounded"
            text: Icons.getAudioSinkIcon(sink_item.isBluetooth, Audio.sink)
            color: Pywal.colors.color2
        }
    }

    Item {
        id: mic_item
        visible: Audio.source?.audio?.muted ?? false
        implicitHeight: mic.height
        implicitWidth: mic.width

        Text {
            id: mic
            font.pointSize: 17
            font.family: "Material Symbols Rounded"
            text: "mic_off"
            color: Pywal.colors.color2
        }
    }
}
