import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
HistoryBaseTextItem{
    border.color: Material.theme==Material.Dark?"#88CCCCCC":"#881f1f1f"
    textColor:coreStyle.leftInfoStyle.historyListTextColor// "#fff"
    border.width: 1
    Rectangle{
    height: 15
    anchors.left: parent.right
    width: 2
    anchors.verticalCenter: parent.verticalCenter
    color: Material.color(Material.Blue)
    }
}
