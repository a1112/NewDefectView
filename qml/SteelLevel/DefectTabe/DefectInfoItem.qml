import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
ItemDelegate {
    height: 40
    width: parent.width
    RowLayout{
        anchors.fill: parent
        Label {
            text: ""+defectClass

        }
        Label {
            text: "："+name

        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Label {
            text: "<->"
        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Label {
            text: ""+levelDefectClass

        }
        Label {
            text: "：" + levelName

        }

    }
}
