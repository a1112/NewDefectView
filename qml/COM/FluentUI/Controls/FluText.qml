import QtQuick 2.15
import QtQuick.Controls 2.15


Label {
    property color textColor: fluTheme.fontPrimaryColor
    id:text
    color: textColor
    renderType: fluTheme.nativeText ? Text.NativeRendering : Text.QtRendering
}
