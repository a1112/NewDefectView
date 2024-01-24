import QtQuick 2.15
import "../../../../ImageSystem"
import "../../../../ImageSystem/Core"
Item {


//ImageSystemViewItem{
//     isTop:0
//     cameraListMiodel: coreModels.downWidthModel
//     widthData:coreObj.downWidthData
//     visible: imageViewCore.bottomCanVisible
//     imageCount: coreState.maxDownImageCount
//     defctsModel: coreObj.downDefctsModel
//     defctsUserModel:coreObj.downUserDefctsModel
//     cameraStartIndex:1+ coreModels.upWidthModel.count
//     cameraCount:coreModels.downCameraCount
//}

    property real imageShowWidth: root.width/2
        property int isTop
        property int cameraStartIndex: 1
        property ListModel cameraListMiodel:coreModels.upWidthModel //coreModels.upWidthModel
        property int imageCount: coreState.maxUpImageCount
        property int cameraCount: coreModels.downCameraCount
        property ListModel defctsModel: coreObj.upDefctsModel
        property var widthData: coreObj.upWidthData
        property ListModel defctsUserModel: coreObj.upUserDefctsModel
        id:root
        property ImageCore imageCore: ImageCore{}
                ImageViewWindowItem{ // 多个相机显示的区域
                    id:ivwi
                    property int imshowWidth: imageCore.isMaxImageModel?
                                                  index===imageCore.hoverdListIndex?imageShowWidth:0
                    :imageShowWidth
                    visible:true
                    viewActive:imshowWidth
                    width:imshowWidth
                    Behavior on width {NumberAnimation{duration: 450}}
                    height: parent.height
                }

}
