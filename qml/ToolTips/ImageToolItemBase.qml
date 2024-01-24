import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
import QtGraphicalEffects 1.14
import "../Base"
RecBorderToolIte{
    id:root
    property int layoutKey:-1
    property alias source: image.source
    signal clicked()
    property string toolText: ""
    ToolTip.visible: itd.hovered&&toolText
    ToolTip.text: toolText
    ItemDelegate{
        id:itd
        anchors.centerIn: parent
        width: parent.width*0.8
        height: width
        Image {
            visible: false
            width: parent.width
            height: parent.height
            fillMode: Image.PreserveAspectFit
            id: image

        }
        ColorOverlay {
            width: parent.width
            height: parent.height
                source: image
                color: root.checked?Qt.lighter(root.border_color):
                                     coreStyle.isDark?"#eee":"#2e2e2e"
                layer.enabled: true
                layer.effect:DropShadowBase{}
        }
        onClicked: {
        root.clicked()
        }
    }
}


