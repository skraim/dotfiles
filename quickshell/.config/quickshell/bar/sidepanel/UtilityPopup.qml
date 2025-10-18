import QtQuick
import Quickshell
import Quickshell.Wayland
import qs.utils

PanelWindow {
    // id: outerPanel
    
    function dismiss() {
        visible = false;
    }

    function show() {
        visible = true;
    }

    implicitWidth: screen.width
    implicitHeight: screen.height
    color: visible ? ColorUtils.transparentize(Pywal.special.background, .75) : "transparent"
    visible: false
    WlrLayershell.exclusionMode: ExclusionMode.Ignore
    // screen: (typeof modelData !== 'undefined' ? modelData : null)
    anchors.top: true
    anchors.left: true
    anchors.right: true
    anchors.bottom: true
    margins.left: 65

    // MouseArea {
    //     anchors.fill: parent
    //     onClicked: outerPanel.dismiss()
    // }
    //
    // Behavior on color {
    //     ColorAnimation {
    //         duration: 350
    //         easing.type: Easing.InOutCubic
    //     }
    // }
    //
    TimeWeatherView {}

    AudioMediaView {}

    NotificationsResourcesView {}
    // Rectangle {
    //     anchors {
    //         bottom: parent.bottom
    //         left: parent.left
    //     }
    //     width: 200
    //     height: 200
    // }
}
