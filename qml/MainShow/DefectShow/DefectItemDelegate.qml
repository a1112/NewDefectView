import QtQuick 2.15
import "../../Base"
Item {     // 单个的缺陷显示
    id:root
    clip: false
    visible: coreModels.defectShowDict[defectID]??true
                                                   x:defectX*defectShowViewroot.x_scale
    y:defectY*defectShowViewroot.y_scale
    width:coreConfig.defectViewShowImageModel?image_loader.width: defectHeight*y_scale>10?defectHeight*y_scale:10
    height:coreConfig.defectViewShowImageModel?image_loader.height: defectWidth*x_scale>10?defectWidth*x_scale:10

    property bool selecrted: x>defectViewState.selectRec.x  &&  x<defectViewState.selectRec.width
                             && y>defectViewState.selectRec.y  &&  y<defectViewState.selectRec.height
    property bool choiced: index===selectDefectIndex
    onChoicedChanged: {
        if (choiced){
            selectItem=root
        }
    }
    onSelecrtedChanged: {
        //选中状态变化
        if(selecrted && visible){
            defectViewControl.appendSelectItem(index,defectViewModel.get(index))
        }
        else{
            defectViewControl.delectSelectItem(index,defectViewModel.get(index))
        }
    }
    Rectangle{
        anchors.centerIn: parent
        width: parent.width+4
        height: parent.height+4
        color: typeof defectColor=="undefined"?control.getColorById(defectID):defectColor
    border.width: selecrted||choiced?2:1
    border.color: choiced?"#f00":selecrted?"#fff":Qt.darker(color)
    }
    scale: handler.hovered||selecrted?2:1
    Behavior on scale {NumberAnimation{duration: 600;easing.type:Easing.OutBack}}
    HoverHandler{
        id:handler
        cursorShape: Qt.PointingHandCursor
        onHoveredChanged: {
            if (hovered){
                hoveredItem=root
                hoveredDefectIndex=index
                defectViewDialog.openPopup(defectViewModel.get(index),point.scenePosition.x,point.scenePosition.y,()=>defectViewControl.appendSelectItem(index,defectViewModel.get(index)))
            }
            else{
                defectViewDialog.close()
                hoveredDefectIndex=-1
            }
        }
    }
            rotation: 90
Loader{
    id:image_loader
    asynchronous: true
    active:coreConfig.defectViewShowImageModel
    sourceComponent:     Image {
        fillMode: Image.PreserveAspectFit
        width: Math.min(sourceSize.width/4,220)
        id: image
        source: api.getImage(cameraId,defectNo)
    }

}
    layer.enabled: true
    layer.effect: DropShadowBase{
        horizontalOffset:3
        verticalOffset:3
    }
}

//defectID:10
//defectX:100
//defectY:300
//defectWidth:20
//defectHeight:40
//defectSource:""
