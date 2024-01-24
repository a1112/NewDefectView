import QtQuick 2.15
import "../Base"

BaseBaseLabel {
    layer.effect: DropShadowBase{}
    layer.enabled: shadowConfig.textEnabled
    font.pixelSize: autoSize.titleButtonTextSize*1.7
}
