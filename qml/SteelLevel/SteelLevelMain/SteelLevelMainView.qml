import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../Base"
import "MaxImageView"
import "DefectList"
SplitViewBase {
    orientation: Qt.Vertical

    DefectListViewRoot{   // L T
        SplitView.fillWidth: true
        SplitView.fillHeight: true
        visible: !steelLevelCore.maxListView
    }
    MaxImageViewItem{
        SplitView.fillWidth: true
        SplitView.preferredHeight: autoSize.levelDefectMaxImageHeight
        SplitView.fillHeight: steelLevelCore.maxListView
    }
}
