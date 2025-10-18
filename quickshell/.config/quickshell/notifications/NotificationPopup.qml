import Quickshell
import QtQuick

Item {
    id: notificationPopup

    anchors.fill: parent

    property var monitors: Quickshell.screens || []
    property bool notificationsVisible: true
    // screen: Quickshell.screens[0]
    // implicitWidth: 0
    // exclusiveZone: 0

    PopupWindow {
        anchor.window: bar_root
        // anchor.rect.x: parentWindow.width / 2 - width / 2
        // anchor.rect.y: parentWindow.height
        // width: 500
        // height: 500
        visible: true
    
    }
}
