import qs.utils
import qs.services
import qs.bar.sidepanel
import qs.bar.widgets
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Hyprland
import Quickshell.Wayland

Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            id: bar_root
            property var modelData
            color: "transparent"
            screen: modelData
            implicitWidth: 65
            exclusiveZone: 65


            anchors {
                top: true
                left: true
                bottom: true
            }

            Rectangle {
                anchors.fill: parent
                color: Pywal.special.background
                // border.color: Pywal.colors.color6
                topLeftRadius: 0
                topRightRadius: 0
                opacity: .9
            }

            WrapperItem {
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                }

                topMargin: -23

                ColumnLayout {
                    spacing: 0

                    DistroWidget {}

                    WorkspacesWidget {}
                }
            }

            WrapperItem {
                id: active_window_wrapper
                readonly property HyprlandMonitor monitor: Hyprland.monitorFor(modelData)
                readonly property Toplevel activeWindow: ToplevelManager.activeToplevel

                property bool focusingThisMonitor: HyprlandData.activeWorkspace?.monitor == monitor.name
                property var biggestWindow: HyprlandData.biggestWindowForWorkspace(HyprlandData.monitors[monitor.id]?.activeWorkspace.id)
                property var appName: ActiveWindowMapper.getAppName(focusingThisMonitor && activeWindow?.activated && biggestWindow ? activeWindow?.appId : (biggestWindow?.class))

                visible: appName && appName != "undefined"
                anchors.centerIn: parent

                ActiveWindow {
                    appName: active_window_wrapper.appName
                }
            }

            WrapperItem {
                anchors {
                    bottom: parent.bottom
                    // bottomMargin: -1
                    left: parent.left
                    right: parent.right
                }

                ColumnLayout {
                    spacing: 5

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignHCenter
                        Layout.bottomMargin: 5
                        spacing: 1

                        CpuWidget {}

                        MemoryWidget {}

                        BatteryWidget {}
                    }

                    AudioWidget {}

                    BluetoothWidget {}

                    NetworkWidget {}

                    UpdatesWidget {}

                    NotificationWidget {}

                    VpnWidget {}

                    KbLayoutWidget {}

                    ClockWidget {popup: test}

                    UtilityPopup {id: test}
                }
            }

            // NotificationPopup {}
            // PopupWindow {
            //     anchor.window: bar_root
            //     // anchor.rect.x: parentWindow.width / 2 - width / 2
            //     //         // anchor.rect.y: parentWindow.height
            //     width: 50
            //     height: 50
            //                                     visible: true
            //     //
            //     //                                         }
            //     //
            // }
        }
    }
}
