import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications
PanelWindow {
  id: toplevel

  anchors {
    top: true
    left: true
    right: true
  }
PopupWindow {
    id: notificationPanel
    
    screen: Quickshell.screens[0]
    anchor {
        window: toplevel
        // top: true
        margins.right: 10
        margins.top: 10
    }
    
    width: 370
    height: Math.min(notifications.implicitHeight + 20, 600)
    visible: NotificationManager.notifications.length > 0
    
    Rectangle {
        anchors.fill: parent
        color: "#222222"
        radius: 10
        border.color: "#444444"
        border.width: 2
        
        ScrollView {
            id: scroll
            anchors.fill: parent
            anchors.margins: 10
            
            ColumnLayout {
                id: notifications
                width: scroll.width
                spacing: 8
                
                Repeater {
                    model: NotificationManager.notifications
                    
                    NotificationWidget {
                        required property Notification modelData
                        notification: modelData
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
}
}
