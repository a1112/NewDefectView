import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtQuick.Dialogs 1.3


Item {
    Layout.fillWidth: true
    height: autoSize.itemListHeight

    FileDialog {
        id: fileDialog
        selectFolder: true
        folder: sampleItemCore.folderSource
        onAccepted: {
            sampleItemCore.folderSource=fileDialog.fileUrl
        }
    }

    Menu{
        id: menu
        MenuItem{
            text: "切换路径"
            onTriggered: {
                fileDialog.open()
            }
        }
    }



    Pane{       // head
        anchors.fill: parent
        Material.elevation: 5
    }
    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: {
            menu.popup()
        }
    }
    RowLayout{
        anchors.fill: parent
        Item{
            height:autoSize.itemListHeight
            width: che.width
       CheckDelegate{
           id:che
            text: "筛选"

       }
        }

    Item{
        Layout.fillWidth: true
        Layout.fillHeight: true
    }

    Label{
        text: sampleItemCore.folderSource.replace("file:///", "")
        MouseArea{
            cursorShape: Qt.PointingHandCursor
            anchors.fill: parent
            onClicked: {
                Qt.openUrlExternally(folderSource)
            }
            onDoubleClicked: {
                fileDialog.open()
            }
        }

    }

    }

}
