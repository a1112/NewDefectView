import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../../../Labels"

Item {
    enabled: visible
    width: visible?cellWid:0
    height: visible?cellWid:0
    scale: hov.containsMouse?1.2:1
    z:hov.containsMouse?9999:0
    visible: (steelLevelCore.defectCanViewList[defectID] === undefined || steelLevelCore.defectCanViewList[defectID]) &&
             (steelLevelCore.checkDefectClasses[grade] === undefined||steelLevelCore.checkDefectClasses[grade])
Item{
    anchors.centerIn: parent
    width: parent.width-5
    height: parent.height-5
    Pane{
        anchors.fill: parent
        Material.elevation: 8
    }

    ColumnLayout{
        anchors.fill: parent
        spacing: 0
Image {
    Layout.fillWidth: true
    Layout.fillHeight: true
    id: defectOne
    width: parent.width
    height: parent.height
    source: api.getImage(cameraId,defectNo)
    fillMode: Image.PreserveAspectFit
}
Rectangle{
    Layout.fillWidth: true
    height: 2
    color:control.getColorById(defectID)
}
    }
    LabelBase{
        text: control.getNameById(defectID)
        font.bold: true
        font.pixelSize: 22
        color:control.getColorById(defectID)
    }

    RowLayout{
        Layout.fillWidth: true
        height: 30
        anchors.bottom: parent.bottom
        LabelBase{
            color: Material.color(Material.Blue)
            text: "距头："+""
            font.bold: true
            font.pixelSize: 15
            background: Rectangle{color: "#89000000"}
            visible: steelLevelCore.visDefectClass==-1
        }
        LabelBase{
            color: Material.color(Material.Green)
            text: "操作测："+""
            font.bold: true
            anchors.right: parent.right
            font.pixelSize: 15
            background: Rectangle{color: "#89000000"}
        }
    }
}


MouseArea{
    id:hov
    acceptedButtons: Qt.LeftButton|Qt.RightButton
    anchors.fill: parent
    hoverEnabled: true
    onContainsMouseChanged: {
        if(containsMouse){
        steelLevelCore.defectHoved=true
        }
        else
        steelLevelCore.defectHoved=false

        if(containsMouse){
            steelLevelCore.setSelectDefect(steelLevelCore.defectListModel,index,steelLevelCore.selectTopIndex)
            fc.forceActiveFocus()
        }

    }
    onClicked: {
        if (mouse.button==Qt.RightButton){
            steelLevelCore.selectModelIndex=0
        }

    }
}


Rectangle{
    color: "#00000000"
    border.width: 3
    border.color: Material.accentColor
    width: cellWid
    height: cellWid
    visible: hov.containsMouse

}
//MouseArea{
//    id:ev
//    enabled: false
//    anchors.fill: parent
//    onWheel: (event)=> {
//                            if(event.angleDelta.y>0){
//                               steelLevelCore.cellWidthScale*=1.1
//                            }
//                            else{
//                               steelLevelCore.cellWidthScale/=1.1
//                            }
//                            if (steelLevelCore.cellWidthScale<0.5)
//                                steelLevelCore.cellWidthScale=0.5
//                        }

//}
}

