import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
SelectRectangle{
    id:root
// 区域选择的基础矩形
property real startX: 0
property real startY: 0
property real endX: 0
property real endY: 0
property real minX: Math.min(startX,endX)
property real maxX: Math.max(startX,endX)
property real minY:Math.min(startY,endY)
property real maxY: Math.max(startY,endY)

property real startX_m: 0
property real startY_m: 0
property real endX_m: 0
property real endY_m: 0
property real mm_w: Math.abs(endX_m-startX_m)
property real mm_h: Math.abs(endY_m-startY_m)
width: Math.abs( endX-startX)
x:Math.min(startX,endX)
height:Math.abs( endY-startY)
y:Math.min(startY,endY)
//property real absX: endX-startX
//property real absY: endY-startY
//function refreshX (){
//width= Math.abs( endX-startX)
//x=Math.min(startX,endX)
//}
//function refreshY (){
//    height= Math.abs( endY-startY)
//    y=Math.min(startY,endY)
//}
//onEndXChanged: refreshX()
//onEndYChanged: refreshY()
Label{
    visible: root.width>1
color: "red"
anchors.horizontalCenter: parent.horizontalCenter
text: coreModels.unitType==="m"?(mm_w/1000)+" m": mm_w+" mm"
font.pointSize: 12
}
Label{
    visible: root.width>1
color: "red"
anchors.verticalCenter: parent.verticalCenter
text:  coreModels.unitType==="m"?(mm_h/1000)+" m": mm_h+" mm"
font.pointSize: 12
}
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
