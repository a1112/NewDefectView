import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "Head"
import "Footer"
import "../../Comps/SimpleList"
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
