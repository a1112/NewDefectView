import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "SteelShow"
Item {
    id:root
    Layout.fillWidth: true
    Layout.fillHeight: true
    property bool isUpSurface: false
    property int currentDefectId: steelLevelCore.currentDefectId // 当前的缺陷索引号
    property string currenctmaxImageSource:steelLevelCore.currenctmaxImageSource  // 大图的 source
    readonly property ListModel currentImageObjects: steelLevelCore.currentImageObjects
    ColumnLayout{
        anchors.fill: parent
        spacing: 2 //0.1*dpi
        ImageShowViewHead{  // head
            Layout.fillWidth: true
        }
        StackLayout{
            currentIndex:steelLevelCore.selectModelIndex
            onCurrentIndexChanged: {
            steelLevelCore.selectModelIndex = currentIndex
            }
            Layout.fillWidth: true
            Layout.fillHeight: true
            MaxImageShowView{
                WheelHandler{// 通过滚动切换缺陷显示
                    onWheel: steelLevelCore.selectNextImage(-event.angleDelta.y)
                }
            }
            MaxImageListShowView{// 缺陷浏览
            }

            SteelShowView{
            }

        }
    }
}

