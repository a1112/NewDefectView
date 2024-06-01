import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../Labels"
Item {
    Layout.fillWidth: true
    Layout.fillHeight: true
    property alias model: listView.model
    property int steelTypeIndex:currentDefectIndex
    property var currentLevelData: {
    }

    property ListModel name: ListModel{

    }

    onSteelTypeIndexChanged: {
        currentLevelData = coreModels.defectTabelData[steelTypeIndex]

    }

    ColumnLayout{
        anchors.fill: parent
        TitleLabel {
            Material.foreground: Material.Blue
            text: name
            Layout.alignment: Qt.AlignHCenter
        }
ListView {
    clip: true
    id: listView
    delegate: Item {
        width: listView.width
        height: 50
        Rectangle {
            width: parent.width
            height: 1
            color: "black"
        }
        Text {
            text: modelData
            anchors.centerIn: parent
        }
    }

}
}
}
