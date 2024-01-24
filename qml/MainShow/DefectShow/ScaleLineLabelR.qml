import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../Base"
Item {
    id:root
    width: 0.1*dpi
    height: parent.height
    property color labColor: "#F19101"
    LabelBase{
        width: parent.width
        text:"传动侧"
        font.bold: true
        color: labColor
        wrapMode: TextEdit.WrapAnywhere
    }
    LabelBase{
        anchors.bottom: parent.bottom
        font.bold: true
        color: labColor
        width: parent.width
        text:"操作侧"
        wrapMode: TextEdit.WrapAnywhere
    }

}
