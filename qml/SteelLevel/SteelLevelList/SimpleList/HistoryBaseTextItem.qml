import QtQuick 2.15
import QtQuick.Controls 2.15
Rectangle{

    color: "#00000000"
    height: parent.height
    property alias textColor: lab.color
    property alias text: lab.text
    Item{
            clip: true
            anchors.fill: parent
               Label
                {
                    id:lab
                    color:"#fff"
                    text: qsTr("钢板号")
                    font.pixelSize:autoSize.listTextSize
                    anchors.horizontalCenter: parent.horizontalCenter
                }
    }
}
