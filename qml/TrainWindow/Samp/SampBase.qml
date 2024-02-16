import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
ItemDelegate {
    Layout.fillWidth: true
    width: parent.width
    height: 35
    property string title: ""
    property alias item:loader.sourceComponent
    RowLayout{
        anchors.fill: parent
        Label{
            text: title
            font.pixelSize: 20
        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Loader{
            id: loader
        }
    }
}
