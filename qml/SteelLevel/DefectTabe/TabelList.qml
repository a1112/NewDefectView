import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
ListView {
    id:root


    highlight : Rectangle{
        color: "#000000"
        border.color: "red"
        border.width: 1
    }
    delegate: ItemDelegate {
             text: name
             height: 30
             width:root.width
             ToolTip.visible: hovered
             ToolTip.text: name
             font.bold: true
            onClicked: {
                levelTabel.currentDefectIndex=index
            }
         }
}
