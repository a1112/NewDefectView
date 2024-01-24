import QtQuick 2.15
import "CrossView"
Rectangle {
    id:drawView
    color: "#20000000"
    property bool selectCanView: false
    property alias containsMouse: mouse.containsMouse
    property real imageShowHeight: 100
    property real imageShowWidth: 100
    property var imageWidthInfoList
    property alias showInageIndex_x: cross.showInageIndex_x
    property alias showInageIndex_y: cross.showInageIndex_y
    property alias startY_: cross.startY_
    signal click()

    BorderToolItem{
        width: sel.width
        height: sel.height
        x:sel.x
        y:sel.y
        checked:!selectCanView
    }
    CrossView{
        width: drawView.width
        height: drawView.height
        id:cross
        visible: mouse.containsMouse
        labelX: flickable.contentX
        labelY:flickable.contentY
        cross_x:mouse.mouseX
        cross_y:mouse.mouseY
    }
    MouseArea{
        id:mouse
        hoverEnabled: true
        cursorShape: Qt.TouchPointMoved
        anchors.fill: parent
        onPressed:{
            selectCanView=true
            sel.startX_m=cross.mm_v
            sel.startY_m=cross.mm_h
            sel.endX_m=cross.mm_v
            sel.endY_m=cross.mm_h

            sel.startX=mouse.x
            sel.startY=mouse.y
            sel.endX=mouse.x
            sel.endY=mouse.y
        }
        onPositionChanged: {
                if (selectCanView){
                sel.endX=mouse.x
                sel.endY=mouse.y
                sel.endX_m=cross.mm_v
                sel.endY_m=cross.mm_h
                }
        }
        onReleased: {
            selectCanView=false
        }
        onClicked: {
//            selectCanView=false
            drawView.click()
        }
        onDoubleClicked: {
            if (hoveredDefectIndex>=0){ //双击某个缺陷
                oneDefectViewDialog.updata(hoveredDefectObj)
            }
        }
    }
    SelectItem{

        id:sel
       visible: true
   }
}

