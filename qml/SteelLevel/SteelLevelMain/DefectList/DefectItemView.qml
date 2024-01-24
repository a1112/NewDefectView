import QtQuick 2.15
import "../../../Base"
import "../../../Sql/Obj"
Item {
    id:root
    property alias hovered: mouseArea.containsMouse
    visible: (steelLevelCore.defectCanViewList[defectID] === undefined || steelLevelCore.defectCanViewList[defectID]) &&
             (steelLevelCore.checkDefectClasses[grade] === undefined||steelLevelCore.checkDefectClasses[grade])
    x:(boxX/viewMoels.imageWidth + (cameraId-viewMoels.cameraStartInex)) * canvasWidth
    y:(imageIndex+boxY/viewMoels.imageHeight) * canvasHeight
    width: Math.max(boxW/viewMoels.imageWidth*canvasWidth,5)
    height: Math.max(boxH/viewMoels.imageHeight*canvasHeight,5)
    LabelBase{
        visible: steelLevelCore.canVisDefectLabel
        text: viewMoels.getDefectName(viewMoels.defectDict,defectID)+grade
        color: viewMoels.getDefectColor(viewMoels.defectDict,defectID)
        font.pixelSize: 14
        y:-height
        x:0
        scale: hovered?3:1
    }
    Rectangle{
        id:bx
        anchors.fill: parent
        opacity: 0.4
        color: viewMoels.getDefectName(viewMoels.defectDict,defectID)
    }
    Rectangle{
        id:bxb
        anchors.fill: parent
        color: "#00000000"
        border.color: viewMoels.getDefectColor(viewMoels.defectDict,defectID)
        border.width: 1
    }

    MouseArea{
        id:mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onContainsMouseChanged: {
            if(containsMouse){
                steelLevelCore.setAcTiveSelect(topIndex)
                steelLevelCore.setSelectDefect(steelLevelCore.allDefectModel,index,topIndex)
                defectItemVis=true
            }
            else
                 defectItemVis=false
        }
    }

}
