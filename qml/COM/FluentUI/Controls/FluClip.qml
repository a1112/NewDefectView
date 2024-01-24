import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0


Rectangle {
    id:control
    color: "#00000000"
    layer.enabled: !FluTools.isSoftware()
    layer.effect: OpacityMask{
        maskSource:Rectangle{
            radius: control.radius
            width: control.width
            height: control.height
        }
    }
}
