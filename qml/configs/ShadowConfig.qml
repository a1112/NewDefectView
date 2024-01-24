import QtQuick 2.15
import "../Base"
Item {
    id:root
    property bool enabled: true
    property int horizontalOffset: 3
    property int verticalOffset: 3
    property real radius: 8.0
    property int samples: 17
    property string color: "#40000000"
    property bool textEnabled: true
//    SettingsBase{
//        category:"shadow"
//        property alias enabled: root.enabled
//        property alias horizontalOffset: root.horizontalOffset
//        property alias verticalOffset: root.verticalOffset
//        property alias radius: root.radius
//        property alias samples: root.samples
//        property alias color: root.color
//        property alias textEnabled: root.textEnabled
//    }
}
