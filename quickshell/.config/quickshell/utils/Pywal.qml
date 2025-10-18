pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    property alias special: adapter.special
    property alias colors: adapter.colors

    FileView {
        path: `${Quickshell.env("HOME")}/.cache/wal/colors.json`
        watchChanges: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: adapter

            property JsonObject special: PywalSpecial {}
            property JsonObject colors: PywalColors {}
        }
    }
}
