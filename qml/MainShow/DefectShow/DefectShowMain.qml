import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ColumnLayout {
    Item{
        height: 0.1*dpi
        width: 1
    }
    ShowMainItemManage{
        cameraListMiodel: coreModels.upWidthModel
        isUpSurface:true
        imageCount: coreState.maxUpImageCount
    }
    ShowMainItemManage{
        cameraListMiodel: coreModels.downWidthModel
        imageCount: coreState.maxDownImageCount
        isUpSurface:false
    }
}
