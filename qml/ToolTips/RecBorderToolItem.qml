import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../Base"
Rectangle{
    height: parent.height
    width: height
    property bool vis: true
    id:root
    visible: height!==0
    property alias text: itemdelegate.text
    signal clicked
    property alias checked: itemdelegate.highlighted
    Behavior on height{
        NumberAnimation{duration: 400}
    }
    ItemDelegate{
        id:itemdelegate
        onClicked: {
            root.clicked()
            highlighted=!highlighted
        }

        width: parent.width
        height: parent.height
    }
    layer.enabled: true
    layer.effect:
        DropShadowBase{}

}
