import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../TrainWindow/Samp"
ApplicationWindow {
    flags: Qt.Dialog
    id:trainWindow
    visible: true
    width: 640
    height: 800
    title: qsTr("测试")
    ColumnLayout{
        anchors.fill: parent
        SampComboBox{
            title: "模型"

        }

    }

}
