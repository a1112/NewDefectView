import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "OtherShowMain"
Item {
    id:root
    Layout.fillWidth: true
    Layout.fillHeight: true
    property bool isUpSurface: false
    property var dsmItem
    property int currentDefectId: dsmItem.currentDefectId // 当前的缺陷索引号
    property string currenctmaxImageSource:dsmItem.currenctmaxImageSource  // 大图的 source
    readonly property ListModel currentImageObjects: dsmItem.currentImageObjects
    ColumnLayout{
        anchors.fill: parent
        spacing: 2 //0.1*dpi
        ImageShowViewHead{
            Layout.fillWidth: true
        }
        MaxImageShowView{
            Layout.fillWidth: true
            Layout.fillHeight: true
            dsmItem:root.dsmItem
        }
    }
    WheelHandler{// 通过滚动切换缺陷显示
        onWheel: dsmItem.selectNextImage(-event.angleDelta.y)

    }
}

