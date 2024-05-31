import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "Head"
import "Footer"
import "../../Comps/SimpleList"
import "../../Base"
import "../../btns"
SplitView{
    orientation :Qt.Vertical
ColumnLayout {
    SplitView.fillHeight: true
    SplitView.fillWidth: true
    Item{
        Layout.fillWidth: true
        height: autoSize.itemListHeight
        Pane{
            anchors.fill: parent
            Material.elevation: 7
        }
        RowLayout{
            anchors.fill: parent
            LevelSelect{
            }
            Item{
                Layout.fillWidth: true
                height: 1
            }
            ItemDelegate{
                height: 30
                width: 35
                ToolTip.text: "判级图谱"
                ToolTip.visible: hovered
            ColorImageButton{
                height: 30
                source: coreStyle.getIcon("pie")
            }
            onClicked: {
                console.log("判级图谱")
                defectTabelView.open()
            }
            }
            ItemDelegate{
                height: 30
                width: 35
                ToolTip.text: "导出判级信息"
                ToolTip.visible: hovered
            EffectImage{
                height: 30
                source: coreStyle.getIcon("uploading")
            }
            onClicked: {
                console.log("导出判级信息")
                levelExportView.open()
            }
            }
            Item{
                width: 10
                height: 1
            }

        }
    }
    SteelListBase{
        Layout.fillWidth: true
        Layout.fillHeight: true
    }
    }
    DefectIOneView{
        visible: steelLevelCore.defectHoved
        SplitView.preferredHeight: autoSize.levelDefectIOneViewHeight
        SplitView.fillWidth: true
        space:5
    }
    FooterView{
        SplitView.preferredHeight: autoSize.levelFooterViewHeight
        SplitView.fillWidth: true
        space:10
    }

}
