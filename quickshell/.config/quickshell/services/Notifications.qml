pragma Singleton
pragma ComponentBehavior: Bound

import qs.utils
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string icon
    property int count

    Process {
        id: check_notifications
        command: ["dunstctl", "is-paused"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: () => {
                root.icon = Icons.getNotificationIcon(this.text.trim() === "true" ? "dnd" : "default");
            }
        }
    }

    Process {
        id: check_notifications_counter
        command: ["sh", "-c", 'echo "$(dunstctl count displayed) + $(dunstctl count history)" | bc']
        running: true

        stdout: StdioCollector {
            onStreamFinished: () => {
                root.count = parseInt(this.text.trim())
            }
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: () => {
            check_notifications.running = true;
            check_notifications_counter.running = true;
        }
    }
}
