import QtQuick 2.15
import Qt.labs.qmlmodels 1.0
DelegateChooser {
    role: "type"
    DelegateChoice {
        roleValue: "file"
        FileSalectSample {
            title:title_

        }
    }
}
