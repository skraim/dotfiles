import qs.services
import QtQuick
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.Notifications

Item {
    id: root
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    anchors.right: parent.right

    ClippingWrapperRectangle {
        anchors.fill: parent
        // anchors.margins: root.padding

        color: "transparent"
        // radius: Appearance.rounding.normal

        ListView {
            id: list

            model: ScriptModel {
                values: [...NotificationsService.popups].reverse()
            }

            anchors.fill: parent

            orientation: Qt.Vertical
            spacing: 0
            cacheBuffer: QsWindow.window?.screen.height ?? 0

            delegate: Item {
                id: wrapper

                required property NotificationsService.Notif modelData
                required property int index
                readonly property alias nonAnimHeight: notif.nonAnimHeight
                property int idx

                onIndexChanged: {
                    if (index !== -1)
                        idx = index;
                }

                implicitWidth: notif.implicitWidth
                implicitHeight: notif.implicitHeight + (idx === 0 ? 0 : 20)

                ClippingRectangle {
                    anchors.top: parent.top
                    anchors.topMargin: wrapper.idx === 0 ? 0 : 20

                    color: "transparent"
                    radius: notif.radius
                    implicitWidth: notif.implicitWidth
                    implicitHeight: notif.implicitHeight

                    Notification {
                        id: notif

                        modelData: wrapper.modelData
                    }
                }
            }

        }
    }
}
