pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell;
import Quickshell.Io;
import QtQuick;

Singleton {
    id: root

    property int updateInterval: 1000
    property bool bluetoothEnabled: false
    property bool bluetoothConnected: false
    property int bluetoothConnectedCount: 0

    function update() {
        updateBluetoothStatus.running = true
        updateBluetoothEnabled.running = true
        updateBluetoothCount.running = true
    }

    Timer {
        interval: 10
        running: true
        repeat: true
        onTriggered: {
            update()
            interval = root.updateInterval
        }
    }

    Process {
        id: updateBluetoothEnabled
        command: ["sh", "-c", "bluetoothctl show | grep -q 'Powered: yes' && echo 1 || echo 0"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                root.bluetoothEnabled = (parseInt(data) === 1)
            }
        }
    }

    Process {
        id: updateBluetoothStatus
        command: ["sh", "-c", "bluetoothctl info | grep -q 'Connected: yes' && echo 1 || echo 0"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                root.bluetoothConnected = (parseInt(data) === 1)
            }
        }
    }

    Process {
        id: updateBluetoothCount
        command: ["sh", "-c", "bluetoothctl devices Connected | grep 'Device' | wc -l"]
        running: true
        stdout: SplitParser {
            onRead: data => {
                root.bluetoothConnectedCount = parseInt(data)
            }
        }
    }
}
