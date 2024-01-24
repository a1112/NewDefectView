import QtQuick 2.15

import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../../Base"
Item {

    SplitViewBase {
        anchors.fill: parent
        DefectItemCanvas{
            SplitView.fillHeight: true
            SplitView.fillWidth: true
        }
//        DefectListView{
//            SplitView.fillHeight: true
//            SplitView.preferredWidth: 300
//        }

    }
}
