import QtQuick 2.15
import "../../../../../Labels"
// 十字架
Item {
    id:root

    property int lineWidth: 3
    property int cross_x: 0
    property real startY: 0
    property int cross_y: 0
    property int labelX:0
    property int labelY: 0
    property bool crossVisible_: true
    property int mm_h: 0
    property int mm_v: 0
    property real startY_: 0

    property int hovendIndex: 0
    property bool isMaxImageModel: false
    property int showInageIndex_x:isMaxImageModel?
                                    parseInt(root.cross_x/imageShowWidth)+hovendIndex
                                    : parseInt(root.cross_x/imageShowWidth)
    property int showInageIndex_y: parseInt(root.cross_y/imageShowHeight)
property var t : [{"seqNo":616748,"imageCount":15,"steelLen":
         [-256,768,1280,1792,2304,2816,3328,3840,4352,4864,5376,5888,6400,6912,7424],
     "steelLeft":[-1148,-1123,-1142,-1146,-1123,-1127,-1147,-1123,-1127,-1132,-1137,-1141,-1145,-1142,-1132],
     "steelRight":[-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47],
     "imageIndex":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]},{"seqNo":616748,"imageCount":14,
     "steelLen":[-256,768,1280,1792,2304,2816,3328,3840,4352,4864,5376,5888,6400,6912],
     "steelLeft":[47,47,47,47,47,47,47,47,47,47,47,47,47,47],
     "steelRight":[1161,1165,1156,1175,1152,1171,1175,1165,1156,1160,1151,1155,1160,1170],
     "imageIndex":[0,1,2,3,4,5,6,7,8,9,10,11,12,13]}]
    property int  y_border:  root.cross_y/imageShowHeight*coreConfig.imageHeight
    onY_borderChanged: {
            let t_Value=imageWidthInfoList[showInageIndex_x]["steelLen"][showInageIndex_y]
            let b_Value=imageWidthInfoList[showInageIndex_x]["steelLen"][showInageIndex_y+1]
            mm_h=t_Value+(b_Value-t_Value)*((root.cross_y+startY_)/imageShowHeight-showInageIndex_y)
//            coreFunc.getLabelX(imageWidthInfoList,showInageIndex_x,showInageIndex_y,root.cross_y,startY_)

    }
    property int x_border:root.cross_x/imageShowWidth*coreConfig.imageWidth

    onX_borderChanged: {

        let l_Value=imageWidthInfoList[showInageIndex_x]["steelLeft"][showInageIndex_y]
        let r_Value=imageWidthInfoList[showInageIndex_x]["steelRight"][showInageIndex_y]

        mm_v=l_Value+(r_Value-l_Value)*((root.cross_x/imageShowWidth)-parseInt((root.cross_x/imageShowWidth)))
    }

    DashHLine{
        visible: crossVisible_
        id:lineV
        lineWidth:root.lineWidth
        width: parent.width
        y:root.cross_y
    }
    DashVLine{
        visible: crossVisible_
        id:lineH
        lineWidth:root.lineWidth
        height: parent.height
        x:root.cross_x
    }
    LabelFootInfoValue{
        background: Rectangle{color: "#000";opacity: 1}
        color: "red"
        x:x<0?0:labelX
        text:" "+(mm_h/1000)+" <font color=\"green\">m</font>"
        y:lineV.y-height/2
    }
    LabelFootInfoValue{
        background: Rectangle{color: "#000";opacity: 1}
        color: "red"
//        text: root.cross_x
        x:lineH.x-width/2<0?0:lineH.x-width/2
        text:" "+(mm_v/1000)+" <font color=\"green\">m</font>"
        y:labelY
    }
}
