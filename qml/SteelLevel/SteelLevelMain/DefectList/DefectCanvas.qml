import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../../Core"
import "../../../Base"
RowLayout{
    property DefectListFuncCore defectListCore: DefectListFuncCore{}
    property ItemMoels viewMoels:topIndex===0?coreState.topMoels:coreState.bottonMoels
    property var defectItemData
    property bool defectItemVis: false

    ColumnLayout{
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 1
        HeadView{   //   title  view
        }
        Item{
            id:viewItem
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            Item{
                width: parent.width-5
                height: parent.height-5
                anchors.centerIn: parent
                Pane{
                    anchors.fill: parent
                    anchors.centerIn: parent
                    Material.elevation: 10
                }
                Rectangle{
                    anchors.centerIn: parent
                    width: parent.width-4
                    height: parent.height-8
                    color: "#1f1f1f"
                    id:cav
                    onHeightChanged: {
                        steelLevelCore.canHeight=height
                    }
                    Flickable{
                        anchors.fill: parent
                        contentWidth: it.width
                        contentHeight: it.height
                        id:flickable
                        CanvasView{//                 <- -------------------------------------------------
                            width:cav.width
                            id:it
                        }
                         ScrollBar.vertical: ScrollBar { }
                    }
                    MsgView{ // no View
                        id:msgView
                        visible: false
                        y:hh_m.point.position.y
                    }
                }
            }
        }
    }
    DefectListView{ // 右侧列表
        visible: true
        Layout.fillHeight: true
        width: autoSize.levelDefectListWidth
    }
}
