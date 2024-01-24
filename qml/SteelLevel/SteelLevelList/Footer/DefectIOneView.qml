import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../../Base"
import "../../../Labels"
Item {
    property int space: 10

    Item {
        anchors.centerIn: parent
        width: parent.width-space
        height: parent.height-space

        Pane{
            anchors.fill: parent
            Material.elevation: 12
        }

        RowLayout{
            anchors.fill: parent
            DefectImageViewItem{

            }

            Item{
                width: 246
                Layout.fillHeight: true
                InfoMsg{
                }
            }

        }
    }


}
