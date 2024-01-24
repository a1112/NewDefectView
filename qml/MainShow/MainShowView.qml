import QtQuick 2.15
import QtQuick.Layouts 1.15
import "DefectShow"
import "DefectShow/DefectListView"
import "../Comps/DefectItemList"
ColumnLayout {
    id:root
    anchors.fill: parent
    spacing: 0
    NavigationView{}
    Rectangle{
        Layout.fillWidth: true
        color: "#9C9C9C"
        height: dpi*0.02
    }
    Item{
         Layout.fillWidth: true
         height: dpi*0.1
    }
    Item{
        Layout.fillWidth: true
        height: dpi*0.5
        DefectItemListView{
            id:dilv
            model: coreModels.defectListModel
        }        //  缺陷列表
        DefectListView{
            anchors.top: dilv.bottom
            width:root.width
        }    // List 显示缺陷
    }
    Item{
        Layout.fillWidth: true
        Layout.fillHeight: true
        DefectShowMain{ //<-
        anchors.fill: parent
//            rotation: 90
            anchors.centerIn: parent
        }


    }
}
