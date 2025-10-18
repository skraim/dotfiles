import qs.utils
import qs.services
import QtQuick
import QtQuick.Layouts
import QtQuick.Window
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects

ColumnLayout {
    Layout.fillWidth: true
    Layout.topMargin: 7
    spacing: 0

    Repeater {
        model: ScriptModel {
            objectProp: "name"
            values: {
                const workspaces = [...Hyprland.workspaces.values];

                let result = Array.from({
                    length: 10
                }, (_, i) => ({
                            name: String(i + 1)
                        }));

                for (const ws of workspaces) {
                    const num = parseInt(ws.name, 10);
                    if (num >= 1 && num <= 10) {
                        result[num - 1] = Object.assign({}, result[num - 1], ws);
                    } else {
                        result.push(ws);
                    }
                }

                return result;
            }
        }

        Item {
            id: ws_row
            required property var modelData
            required property var index
            implicitWidth: ws_row_inner.width
            implicitHeight: 0
            Layout.bottomMargin: !!modelData.id ? 5 : 0

            Behavior on implicitHeight {
                NumberAnimation {
                    duration: 100
                }
            }

            states: [
                State {
                    name: "visible"
                    when: ws_row.modelData.id || HyprlandData.workspaceApps(ws_row.modelData.id).length > 0
                    PropertyChanges {
                        target: ws_row
                        implicitHeight: ws_row_inner.implicitHeight
                    }
                },
                State {
                    name: "hidden"
                    when: !ws_row.modelData.id
                    PropertyChanges {
                        target: ws_row
                        implicitHeight: 0
                    }
                }
            ]

            // HoverHandler {
            //     id: mouse
            // }
            MouseArea {
                id: mouse
                hoverEnabled: true
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    if (HyprlandData.workspaceApps(-99).find(app => app.focusHistoryID == 0)) {
                        Hyprland.dispatch(`togglespecialworkspace`);
                        if (ws_row.modelData.name.startsWith("special")) {
                            return;
                        }
                    }

                    Hyprland.dispatch(`workspace ${ws_row.modelData.name}`);
                }
            }

            // Rectangle {
            //     anchors.fill: parent
            //     radius: 3
            //     border.width: test.containsMouse ? 1 : 0
            //     border.color: test.containsMouse ? Pywal.colors.color12 : "transparent"
            //     color: "transparent"
            //
            //     trassitions: Transition {
            //     }
            // }

            Rectangle {
                id: ws_row_rect
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                radius: 2
                opacity: 0
                color: !!ws_row.modelData.urgent ? Pywal.colors.color3 : Pywal.colors.color8
                width: ws_row_inner.width

                states: [
                    State {
                        name: "focused"
                        when: !!HyprlandData.workspaceApps(ws_row.modelData.id).find(app => app.focusHistoryID == 0) && HyprlandData.workspaceApps(modelData.id).length  //!!modelData.focused && HyprlandData.workspaceApps(modelData.id).length

                        PropertyChanges {
                            ws_row_rect {
                                opacity: 1
                            }
                        }
                    },
                    State {
                        name: "urgent"
                        when: !!ws_row.modelData.urgent

                        PropertyChanges {
                            ws_row_rect {
                                opacity: 1
                            }
                        }
                    }
                ]

                transitions: [
                    Transition {
                        from: "*"
                        to: "focused"
                        SequentialAnimation {
                            PauseAnimation {
                                duration: 100
                            }
                            NumberAnimation {
                                properties: "opacity"
                                duration: 150
                            }
                        }
                    },
                    Transition {
                        from: "*"
                        to: "urgent"
                        SequentialAnimation {
                            loops: Animation.Infinite

                            PropertyAnimation {
                                target: ws_row_rect
                                property: "opacity"
                                from: .1
                                to: .4
                                duration: 300
                            }
                            PropertyAnimation {
                                target: ws_row_rect
                                property: "opacity"
                                from: .4
                                to: .1
                                duration: 600
                            }
                        }
                    }
                ]
            }

            RowLayout {
                id: ws_row_inner
                spacing: 0

                Item {
                    id: label_wrapper
                    implicitWidth: 10
                    implicitHeight: !!ws_row.modelData.id ? 20 : 0
                    Layout.preferredWidth: 30

                    Rectangle {
                        id: hovering_rect
                        anchors.fill: parent
                        topRightRadius: 5
                        bottomRightRadius: 5
                        topLeftRadius: 2
                        bottomLeftRadius: 2
                        color: mouse.containsMouse ? ColorUtils.transparentize(Pywal.colors.color6, .75) : "transparent"

                        Behavior on color {
                            ColorAnimation {
                                duration: 150
                            }
                        }
                    }

                    Rectangle {
                        id: rect
                        topRightRadius: 5
                        bottomRightRadius: 5
                        topLeftRadius: 2
                        bottomLeftRadius: 2
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        color: Pywal.colors.color6

                        states: State {
                            name: "focused"
                            when: !!HyprlandData.workspaceApps(ws_row.modelData.id).find(app => app.focusHistoryID == 0)

                            PropertyChanges {
                                rect {
                                    height: label_wrapper.height
                                    width: label_wrapper.width
                                }
                            }
                        }
                        transitions: Transition {
                            SequentialAnimation {
                                NumberAnimation {
                                    properties: "width"
                                    duration: 100
                                }
                                NumberAnimation {
                                    properties: "height"
                                    duration: 100
                                }
                            }
                        }
                    }

                    Text {
                        id: label
                        visible: !!modelData.id
                        anchors.centerIn: parent
                        horizontalAlignment: Text.AlignHCenter
                        text: modelData.name.startsWith("special") ? "" : modelData.name
                        color: !!HyprlandData.workspaceApps(ws_row.modelData.id).find(app => app.focusHistoryID == 0) ? Pywal.colors.color0 : Pywal.colors.color2

                        font {
                            family: modelData.name.startsWith("special") ? "ProFont IIx Nerd Font Mono" : "ProFont IIx Nerd Font"
                            pointSize: modelData.name.startsWith("special") ? 15 : 11
                            weight: 700
                        }

                        Behavior on color {
                            ColorAnimation {
                                duration: 100
                            }
                        }
                    }
                }

                WrapperItem {
                    Layout.preferredWidth: 35

                    RowLayout {
                        id: apps
                        visible: HyprlandData.workspaceApps(modelData.id).length
                        spacing: -7

                        Repeater {
                            model: ScriptModel {
                                values: {
                                    const apps = HyprlandData.workspaceApps(modelData.id).filter(app => app.class).sort((a, b) => HyprlandData.biggestWindowForWorkspace(modelData.id).class == a.class ? -1 : 1).map(app => app.class).reduce((acc, app) => {
                                        acc.set(app, (acc.get(app) || 0) + 1);
                                        return acc;
                                    }, new Map());
                                    const firstTwoEntries = new Map([...apps.entries()].sort((a, b) => b[1] - a[1]).slice(0, 2));
                                    return [...firstTwoEntries];
                                }
                            }

                            delegate: Item {
                                id: app
                                property var appIconSource: Quickshell.iconPath(AppSearch.guessIcon(modelData[0]), "image-missing")
                                property int index
                                property var totalApps: {
                                    return HyprlandData.workspaceApps(ws_row.modelData.id).map(app => app.class).reduce((acc, app) => {
                                        acc.set(app, (acc.get(app) || 0) + 1);
                                        return acc;
                                    }, new Map());
                                }

                                Layout.alignment: totalApps.size > 1 ? Qt.AlignLeft : Qt.AlignHCenter
                                implicitHeight: app_icon.height
                                implicitWidth: app_icon.width
                                opacity: 1

                                // FIXME
                                NumberAnimation {
                                    id: fadeInAnimation
                                    target: app
                                    property: "opacity"
                                    from: 0
                                    to: 1
                                    duration: 150
                                }

                                Component.onCompleted: {
                                    if (modelData[1] == 1) {
                                        fadeInAnimation.start();
                                    }
                                }

                                IconImage {
                                    id: app_icon
                                    source: parent.appIconSource
                                    implicitSize: 17
                                    z: parent.index
                                }

                                Desaturate {
                                    id: desaturatedIcon
                                    visible: false
                                    anchors.fill: parent
                                    source: app_icon
                                    desaturation: .7
                                }

                                ColorOverlay {
                                    id: color_overlay
                                    anchors.fill: desaturatedIcon
                                    source: desaturatedIcon
                                    color: ColorUtils.transparentize(Pywal.colors.color6, .75)
                                    opacity: 1

                                    states: State {
                                        name: "focused"
                                        when: HyprlandData.workspaceApps(ws_row.modelData.id).find(app => app.focusHistoryID == 0)?.class == modelData[index]

                                        PropertyChanges {
                                            color_overlay {
                                                opacity: 0
                                            }
                                        }
                                    }

                                    transitions: Transition {
                                        NumberAnimation {
                                            properties: "opacity"
                                            duration: 150
                                        }
                                    }
                                }

                                ClippingWrapperRectangle {
                                    id: counter
                                    visible: modelData[1] > 1
                                    color: Pywal.colors.color0
                                    width: 12
                                    height: 12
                                    radius: 10
                                    anchors.top: app_icon.top
                                    anchors.right: app_icon.right
                                    anchors.topMargin: -4
                                    anchors.rightMargin: -3
                                    z: index + 1
                                    opacity: 1

                                    states: State {
                                        name: "focused"
                                        when: HyprlandData.workspaceApps(ws_row.modelData.id).find(app => app.focusHistoryID == 0)?.class == modelData[index]

                                        PropertyChanges {
                                            color_overlay {
                                                opacity: 0
                                            }
                                        }
                                    }

                                    transitions: Transition {
                                        NumberAnimation {
                                            properties: "opacity"
                                            duration: 150
                                        }
                                    }

                                    Text {
                                        horizontalAlignment: Text.AlignHCenter
                                        verticalAlignment: Text.AlignVCenter
                                        lineHeight: 0.5
                                        visible: modelData[1] > 1
                                        text: modelData[1]
                                        color: Pywal.colors.color3
                                        font.pointSize: 8
                                        font.weight: 600
                                        font.family: "MesloLGL Nerd Font Mono"
                                    }
                                }

                                Desaturate {
                                    id: desaturatedCounter
                                    visible: modelData[1] > 1 && HyprlandData.workspaceApps(ws_row.modelData.id).find(app => app.focusHistoryID == 0)?.class != modelData[index]
                                    anchors.fill: counter
                                    source: counter
                                    desaturation: .4
                                    z: index + 2
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
