import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../Base"
Item {
    anchors.fill: parent
    ColumnLayout{
    anchors.fill: parent
    ListHeadView{
    }
    RowLayout{
        Layout.fillWidth: true
        Layout.fillHeight: true
        spacing: 0
        Item{
            id:item
            clip: true
            Layout.fillHeight: true
            Layout.fillWidth: true
        ListMainView{
            width: parent.width
            height: contentHeight>item.height-100?item.height-100:contentHeight
            ScrollBar.vertical:scr
        }
}
        ScrollBarBase{
            id:scr
            Layout.fillHeight: true
            width: 0.15*dpi
            policy :ScrollBar.AlwaysOn
        }
        Item{
        width: 0.05*dpi
        }

    }
    }
}
