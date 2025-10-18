pragma Singleton

import qs.utils
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string icon

    Process {
        id: check_kb
        command: ["sh", "-c", `${Quickshell.shellDir}/scripts/get-kb.sh`]
        running: true

        stdout: StdioCollector {
            onStreamFinished: root.icon = Icons.getKbLayoutIcon(this.text.trim());
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: check_kb.running = true
    }
}
