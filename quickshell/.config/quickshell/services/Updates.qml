pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property int count

    Process {
        id: updates_counter
        command: ["sh", "-c", "checkupdates | wc -l"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.count = parseInt(this.text.trim())
        }
    }

    Timer {
        interval: 300000
        running: true
        repeat: true
        onTriggered: updates_counter.running = true
    }
}
