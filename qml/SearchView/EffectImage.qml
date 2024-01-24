import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.13
import QtGraphicalEffects 1.14
Image{
    id:root
    layer.enabled: true
    property bool effect: true
    property real horizontalOffset: 3
    property real verticalOffset: 3
    layer.effect: DropShadow{
        id:drapShadow
        horizontalOffset:root.horizontalOffset
        verticalOffset:root.verticalOffset
        visible: effect
    }
    Behavior on scale {SmoothedAnimation{duration: 300}}
}
