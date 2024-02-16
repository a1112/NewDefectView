import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Qt.labs.folderlistmodel 2.15
Item {
    Pane{
        anchors.fill: parent
        Material.elevation: 12
    }
    GridView{
        id:flick
        clip: true
        interactive :!keyOn
        anchors.fill: parent
        model: sampleItemCore.folderModel
        cellWidth: root.cellWidth
        cellHeight: root.cellHeight
        ScrollBar.vertical: ScrollBar { }
        delegate: ImageViewItem {
             }
    }
    function openMenu(){


    }
    Menu{
        id:menu

    }


}
