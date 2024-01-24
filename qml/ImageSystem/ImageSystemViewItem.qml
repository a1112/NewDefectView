import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "Core"
import "HeadView"
Rectangle{
    property int isTop
    property int cameraStartIndex: 1
    property ListModel cameraListMiodel:coreModels.upWidthModel //coreModels.upWidthModel
    property int imageCount: coreState.maxUpImageCount
    property int cameraCount: 4
    property ListModel defctsModel: coreObj.upDefctsModel
    property var widthData: coreObj.upWidthData
    property ListModel defctsUserModel: coreObj.upUserDefctsModel
    SplitView.preferredWidth: imageViewCore.isHorizontal?root.width/2:root.width
    SplitView.preferredHeight:imageViewCore.isVertical?root.height/2:root.height
    id:app_image_up
    property ImageCore imageCore: ImageCore{}
    ColumnLayout {
        anchors.fill: parent
        spacing: 0
        HeadItem{
            Layout.fillWidth: true
        }
        ImageSystemViewLayout{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
