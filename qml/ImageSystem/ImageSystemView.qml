import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "Core"
import "HeadView"
import "ImageViewWindow"
import "../Comps/SimpleList"
import "../Comps/SimpleList/SimpleListView2250"
import "../Base"
import "../Comps"
Item{
    id:root
    property ImageViewCore imageViewCore: ImageViewCore{ // 单表面
    }
SplitView {
    width: root.width
    height: root.height
   id:app_image
    orientation: imageViewCore.isHorizontal?Qt.Horizontal: Qt.Vertical
    onOrientationChanged: {
        width+=1
        width-=1
    }
   ImageSystemViewItem{
       isTop:1
       cameraListMiodel: coreModels.upWidthModel
       widthData:coreObj.upWidthData
       visible: imageViewCore.topCanVisible
       imageCount: coreState.maxUpImageCount
       defctsModel: coreObj.upDefctsModel
       defctsUserModel:coreObj.upUserDefctsModel
       cameraStartIndex:1
       cameraCount:coreModels.upCameraCount
   }
   ImageSystemViewItem{
        isTop:0
        cameraListMiodel: coreModels.downWidthModel
        widthData:coreObj.downWidthData
        visible: imageViewCore.bottomCanVisible
        imageCount: coreState.maxDownImageCount
        defctsModel: coreObj.downDefctsModel
        defctsUserModel:coreObj.downUserDefctsModel
        cameraStartIndex:1+ coreModels.upWidthModel.count
        cameraCount:coreModels.downCameraCount
   }

}
Component{
    id:cabase
    SimpleListView{
        y:0.2*dpi
        x:root.width-1.5*width
        z: 2
    }
}
Component{
    id:ca2250
    SimpleListView2250{
        y:0.2*dpi
        x:root.width-1.5*width
        z: 2
    }
}
Loader{
    sourceComponent:coreConfig.productionCode=="LG2250"?ca2250:cabase

}

}
