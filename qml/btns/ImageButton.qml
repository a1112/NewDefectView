import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
ItemDelegate{
    property alias source: image.source
    property string tipText: ""
    ToolTip.visible: tipText!=="" && hovered
    ToolTip.text: tipText
    Item{
        anchors.fill: parent
        Image{
            id:image
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }


}
