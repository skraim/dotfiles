import qs.services
import QtQuick
import QtQuick.Layouts

Item {
    Layout.fillWidth: true
    Layout.alignment: Qt.AlignHCenter
    implicitHeight: icon.height
    Layout.bottomMargin: -4

    Text {
        id: icon
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 17
        text: KbLayout.icon
    }
}
