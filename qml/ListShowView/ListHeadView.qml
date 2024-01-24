import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../Base"
import "../btns"
Item {
    //    color: "#55545A"

    Pane{
        anchors.fill: parent
        Material.elevation: 5
    }

    Rectangle{
        anchors.fill: parent
        color: "#22eeeeee"
    }
    Layout.fillWidth: true
    height: 0.55*dpi
    property string steelNo: ""
    Item{
        anchors.centerIn: parent
        width: parent.width*0.96
        height: parent.height*0.9
        LabelBase{
            font.bold: true
            font.pixelSize: dpi*0.17
            color: "#DDEE3A"
            text: qsTr("检测记录"+coreModels.mainListModel.count+"个 ")
        }
        LabelBase{
            font.bold: true
            font.pixelSize: dpi*0.2
            text: coreState.currentSteelNo
            anchors.bottom: parent.bottom
            color: "#22A21E"
        }
        Row{
            spacing:  0.2*dpi
            anchors.right: parent.right
            CheckRec{}
            CheckBox{
                text : "未确认"
            }
            CheckBox{
                text : "仅缺陷"
                checked: coreState.defectOnly
                onCheckedChanged: coreState.defectOnly=checked
            }
            Item{
                height: 1
                width: 0.06*dpi
            }
        }
    }
    FlushButton{
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        //        width: 0.3*dpi
        height: 0.3*dpi
        width: height
        onClicked: {
            //刷新列表
            control.initMainListByNum(100)
        }
    }

}
