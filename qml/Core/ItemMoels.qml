import QtQuick 2.15

Item {
    property ListModel widthModel
    property int imageCount
    property var imageWidthInfoList
    property int cameraCount: 2
    property real canVasScale: 0.1
    property int imageWidth: coreConfig.imageWidth
    property int imageHeight: coreConfig.imageHeight
    property ListModel defctsModel
    //        ListElement{
    //            defectID:10
    //            defectX:100
    //            defectY:300
    //            defectWidth:20
    //            defectHeight:40
    //            defectSource:""
    //        }
    property int cameraStartInex: 0
    property int itemCameraInt: 2

    property var defectDict: coreModels.defectDict

    function getDefectName(defD,index){

        return undefined===defD[index]?"未知":defD[index].name

    }
    function getDefectColor(defD,index){
        return undefined===defD[index]?"#fff":defD[index].color
    }
    property ListModel defectDictModel: coreModels.defectDictModel
    property bool slectDefect: false    // 是否选中缺陷

}
