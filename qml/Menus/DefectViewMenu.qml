import QtQuick 2.15
import QtQuick.Controls 2.15

Menu {
    signal clickShowImageWindow
    signal ckickDefectImageModel
    MenuItemComp{
        checked: otherImageModel
        text:(otherImageModel?qsTr("隐藏 "):qsTr("显示 "))+qsTr("原图窗口")
        onClicked: {
        clickShowImageWindow()
        }
    }
    MenuItemComp{
        text: (coreConfig.defectViewShowImageModel? qsTr("关闭 "):qsTr("开启 ")) +   qsTr("原图模式")
        checked: coreConfig.defectViewShowImageModel
        onClicked: {
            coreConfig.defectViewShowImageModel=!coreConfig.defectViewShowImageModel
            ckickDefectImageModel()
        }
    }
}
