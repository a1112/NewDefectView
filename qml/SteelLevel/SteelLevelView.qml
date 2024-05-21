import QtQuick 2.15
import QtQuick.Controls 2.15
import "ExportView"
import "../Base"
import "SteelLevelList"
import "SteelLevelMain"
import "../Core"
import "../MainShow/DefectShow/Core"
import "../Comps/PopupBase"
Item {
//    property ItemRoot currentItenModel:ItemRoot{}
    property LevelCore steelLevelCore: LevelCore{   // 判级核心
    }

    property int hoveredDefectIndex: 0
    property DefectViewState defectViewState: DefectViewState{}
    SplitViewBase{
        id: splitView
        anchors.fill: parent
        Item{
            SplitView.fillHeight: true
            SplitView.fillWidth: true
        SteelLevelMainView{  //  L
            anchors.fill: parent
        }
        }
        Item{
            SplitView.fillHeight: true
            SplitView.preferredWidth: autoSize.levelListWidth
            SteelLevelListViewRoot{  //R
                anchors.fill: parent
            }
        }
    }


    ExportView{
                id:levelExportView

    }


}
