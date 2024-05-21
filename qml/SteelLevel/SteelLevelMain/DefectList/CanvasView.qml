import QtQuick 2.15
import "../../../Base"
import "Draw"
Item {
    id:root
    property real itemWidth: width/viewMoels.cameraCount
    onItemWidthChanged: steelLevelCore.itemWidth=itemWidth
    property real itemHeight:steelLevelCore.currentCanVasLen
    height:  viewMoels.imageCount *itemHeight
    property real canvasWidth: root.width/viewMoels.cameraCount
    property real canvasHeight: itemHeight
    property int w_width: 10
    Repeater{
        model:steelLevelCore.canVisDefectLabel? viewMoels.imageCount:[]
        delegate: Rectangle{
            height: 1
            width: parent.width
            y:index*itemHeight
            color: "#F1555555"
            Row{
                LabelBase{
                    text: index
                    background: Rectangle{
                        color: "#000"
                    }
                }
            LabelBase{
                text: "  "+viewMoels.imageWidthInfoList[0]["steelLen"][index]/1000
                color: "red"
                background: Rectangle{
                    color: "#000"
                }
            }
            LabelBase{
                text: " m"
                color: "green"
                background: Rectangle{
                    color: "#000"
                }
            }
            }

        }
    }
    Item{
            y:index*itemHeight
            height: itemHeight
            width: parent.width
    }
    DrawView{
        id:dv
        anchors.fill: parent
        imageWidthInfoList:viewMoels.imageWidthInfoList
        imageShowHeight: itemHeight
        imageShowWidth:canvasWidth

        onContainsMouseChanged: {
            if (containsMouse){
                ti.focus=true
                ti.forceActiveFocus()
            }
        }
        Repeater{
            model: viewMoels.defctsModel
            delegate:DefectItemView{    // 缺陷
            }
        }
        Rectangle{
            // 高亮
            x:(steelLevelCore.selectDefect.boxX/viewMoels.imageWidth + (steelLevelCore.selectDefect.cameraId-viewMoels.cameraStartInex)) * canvasWidth-5
            y:(steelLevelCore.selectDefect.imageIndex+steelLevelCore.selectDefect.boxY/viewMoels.imageHeight) * canvasHeight-5
            onYChanged: {

                if (topIndex===steelLevelCore.selectTopIndex){
                if(y<flickable.contentY){
                    flickable.contentY=y-40
                }
                if(y>flickable.contentY+flickable.height){
                    flickable.contentY=(y+40+height)-flickable.height
                }
                }
            }
            width:steelLevelCore.selectDefect.boxW/viewMoels.imageWidth*canvasWidth+10
            height:steelLevelCore.selectDefect.boxH/viewMoels.imageHeight*canvasHeight+10
            color: "#00000000"
            border.width: 1
            border.color: "blue"
            Behavior on height{
                NumberAnimation{duration: 200}
            }
            Behavior on width{
                NumberAnimation{duration: 200}
            }
            Rectangle{
                width: 1
                anchors.horizontalCenter: parent.horizontalCenter
                y:-height
                height: w_width
                color: "blue"
            }
            Rectangle{
                width: 1
                anchors.horizontalCenter: parent.horizontalCenter
                y:parent.height
                height: w_width
                color: "blue"
            }
            Rectangle{
                height: 1
                anchors.verticalCenter: parent.verticalCenter
                x:-width
                width:w_width
                color: "blue"
            }
            Rectangle{
                height: 1
                anchors.verticalCenter: parent.verticalCenter
                x:parent.width
                width:w_width
                color: "blue"
            }
        }

    }


    FocusScope{
        width: 100
        id:ti
        focus: true
        Keys.onPressed:(key)=>{
                           console.log(key.key)
                       }
    }
}
