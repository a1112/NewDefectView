import QtQuick 2.15

ItemMoels {
    widthModel:coreModels.downWidthModel
    imageCount: coreState.maxDownImageCount
    imageWidthInfoList: coreState.downImageWidthInfoList
    defctsModel: coreObj.downDefctsModel
    cameraStartInex: 3
    itemCameraInt: 2
}
