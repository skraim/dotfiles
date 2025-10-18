import qs.utils
import QtQuick

Item {
    id: root
    property bool isActive: ResourcesUsage.memoryUsedPercentage >= .85
    visible: isActive
    implicitHeight: icon.height
    implicitWidth: icon.width

    Text {
        id: icon
        anchors.centerIn: parent
        font.family: "Material Symbols Rounded"
        font.pointSize: 13
        text: "memory_alt"
        color: Pywal.colors.color6
        opacity: 0.0
        states: [
            State {
                name: "blinking"
                when: root.isActive
            }
        ]
        transitions: [
            Transition {
                from: ""
                to: "blinking"
                SequentialAnimation {
                    loops: Animation.Infinite
                    PropertyAnimation {
                        target: icon
                        property: "opacity"
                        from: 1.0
                        to: 0.3
                        duration: 500
                    }
                    PropertyAnimation {
                        target: icon
                        property: "opacity"
                        from: 0.3
                        to: 1.0
                        duration: 500
                    }
                }
            }
        ]
    }
}
