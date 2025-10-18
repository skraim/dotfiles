import qs.services
import qs.utils
import QtQuick
import QtQuick.Layouts
import Quickshell.Io

Item {
    // anchors.horizontalCenter: parent.horizontalCenter
    Layout.alignment: Qt.AlignHCenter
    implicitWidth: clock.width
    implicitHeight: clock.height
    property var popup

    Text {
        id: clock
        font.pointSize: 22
        font.family: "Teko"
        font.weight: 600
        horizontalAlignment: Text.AlignHCenter
        text: Time.time.trim().replace(":", "\n")
        lineHeight: .6
        color: Pywal.special.foreground
        style: Text.Outline
        styleColor: Pywal.colors.color8
        z: 1
    }

    Item {
        id: date_wrapper
        implicitWidth: date.height
        implicitHeight: date.width
        anchors.left: clock.right
        anchors.verticalCenter: clock.verticalCenter
        anchors.verticalCenterOffset: -3
        anchors.leftMargin: -6

        Text {
            id: date
            font.pointSize: 14
            font.weight: 600
            rotation: 270
            anchors.centerIn: parent
            font.letterSpacing: 1.5
            font.family: "Teko"
            text: Time.date
            color: Pywal.colors.color2
        }
    }

    MouseArea {
        id: mouse
        hoverEnabled: true
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        onClicked: {
            if (popup.visible) {
                popup.dismiss();
                return;
            }
            popup.show();
        }
    }
}
