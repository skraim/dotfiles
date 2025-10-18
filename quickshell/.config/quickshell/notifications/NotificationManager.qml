pragma Singleton

import Quickshell
import Quickshell.Services.Notifications
// import QtQuick

Singleton {
    id: notificationManager
    
    property alias server: server
    property alias notifications: server.trackedNotifications
    
    NotificationServer {
        id: server
        
        bodySupported: true
        // bodyMarkupSupported: false
        actionsSupported: true
        actionIconsSupported: true
        imageSupported: true
        persistenceSupported: true
        
        onNotification: notification => {
            console.log("New notification:", notification.summary, notification.body)
            notification.tracked = true
        }
    }
}
