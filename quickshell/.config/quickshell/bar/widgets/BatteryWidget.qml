import qs.utils
import qs.services
import QtQuick

Item {
    id: root
    property bool isActive: Battery.percentage < .5 || Battery.percentage < .9 && Battery.isCharging
    visible: isActive
    implicitHeight: icon.height
    implicitWidth: icon.width

    Text {
        id: icon
        opacity: 0.0
        font.pointSize: 13
        font.family: "Material Symbols Rounded"
        font.letterSpacing: -6
        text: Icons.getBatteryIcon(Battery.percentage) + Icons.getBatteryStateIcon(Battery.chargeState)
        color: Pywal.colors.color6
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
