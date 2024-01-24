import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../../Comps"
import "../"
import "../DefectList/Draw"
Item {
    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton|Qt.RightButton
        onDoubleClicked: {
        sdm.openMaxImageDialogView(currenctmaxImageSource,currentImageObjects)
        }
        onClicked: {
            if(mouse.button==Qt.RightButton){
                steelLevelCore.selectModelIndex=1
            }
        }
    }
    MaxImageComp{
        id:mic
            anchors.fill: parent
        source:currenctmaxImageSource
        imageObjs:currentImageObjects
    }

    DrawView{
        onContainsMouseChanged: {
            if(containsMouse){
            steelLevelCore.defectHoved=true
            }
            else
            steelLevelCore.defectHoved=false
        }
        imageWidthInfoList:steelLevelCore.selectViewMoels.imageWidthInfoList
        width: parent.width
        height: parent.height
        imageShowHeight:mic.height
        imageShowWidth: mic.width
        showInageIndex_y:steelLevelCore.selectDefect.imageIndex
        startY_:steelLevelCore.selectDefect.imageIndex*mic.height
    }
}
