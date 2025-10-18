// NotificationWidget.qml
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Notifications

Rectangle {
    id: root
    required property Notification notification
    
    width: 350
    height: content.implicitHeight + 20
    radius: 8
    color: notification.urgency == NotificationUrgency.Critical ? "#ff4444" : "#333333"
    border.color: "#555555"
    border.width: 1
    
    RowLayout {
        id: content
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        
        // App icon
        Image {
            visible: source != ""
            source: notification.appIcon ? Quickshell.iconPath(notification.appIcon) : ""
            Layout.preferredWidth: 32
            Layout.preferredHeight: 32
            fillMode: Image.PreserveAspectFit
        }
        
        // Text content
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 5
            
            // Summary/Title
            Label {
                visible: text != ""
                text: notification.summary
                font.bold: true
                font.pointSize: 12
                color: "white"
                elide: Text.ElideRight
                Layout.fillWidth: true
            }
            
            // Body text
            Label {
                visible: text != ""
                text: notification.body
                font.pointSize: 10
                color: "#cccccc"
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                Layout.maximumWidth: 250
            }
            
            // Actions
            RowLayout {
                visible: notification.actions.length > 0
                spacing: 5
                
                Repeater {
                    model: notification.actions
                    
                    Button {
                        required property NotificationAction modelData
                        text: modelData.text
                        onClicked: {
                            modelData.invoke()
                            root.notification.tracked = false // Dismiss after action
                        }
                    }
                }
            }
        }
        
        // Close button
        Button {
            text: "✕"
            Layout.preferredWidth: 24
            Layout.preferredHeight: 24
            onClicked: {
                notification.tracked = false
                notification.dismiss()
            }
        }
    }
    
    // Auto-dismiss timer for non-critical notifications
    Timer {
        id: dismissTimer
        interval: notification.urgency == NotificationUrgency.Critical ? 0 : 5000
        running: notification.urgency != NotificationUrgency.Critical
        onTriggered: {
            notification.tracked = false
        }
    }
}
