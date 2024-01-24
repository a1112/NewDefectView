import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "ImageSystem"
import "HeadInfo"
import "FootView"
import "DebugView"
import "DefectNavigationView"
import "MainShow"
import "ListShowView"
import "DefectSystemH"
import "SteelLevel"
import "SampleWindow"
ColumnLayout{
    id:root
    anchors.fill: parent
    HeadInfoView{   //头部信息
        Layout.fillWidth: true
        height: autoSize.titleHeadHeight//dpi*0.5
    }
    SwipeView{
        id:sv
        interactive: false
        currentIndex: appGlobal.appType
        Layout.fillWidth: true
        Layout.fillHeight: true
        Loader{
            asynchronous:true
            active:appGlobal.appType==appGlobal.imageType
            sourceComponent:ImageSystemView{    // image icon
                width: root.width
                height: root.height
            }
        }
        Loader{
            asynchronous:true
            active:appGlobal.appType==appGlobal.defectType
            sourceComponent:  MainLayoutView{ // defect  <-z
                width: root.width
                height: root.height
            }
        }
        Loader{
            asynchronous:true
            active:appGlobal.appType==appGlobal.outLineType
            sourceComponent:Item{
                width: root.width
                height: root.height
            }
        }
        Loader{
            asynchronous:true
            active:appGlobal.appType==appGlobal.minImageDefectType
            sourceComponent:SampleWindowView{
                width: root.width
                height: root.height
            }
        }
        Loader{
            asynchronous:true
            active:appGlobal.appType==appGlobal.minImageDefectType
            sourceComponent:DefectViewH{ // 纵向特殊的 缺陷显示
                width: root.width
                height: root.height
            }
        }
        Loader{
            asynchronous:true
            active:appGlobal.appType==appGlobal.steelLevelType
            sourceComponent:SteelLevelView{ //  判级
                width: root.width
                height: root.height
            }
        }

    }
    FootView{
        Layout.fillWidth: true
        height: 0.2*dpi

    }
}
