import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../Base"
MenuItem {
    id:root
    property bool selected: false
    font.bold: selected
    Material.foreground: selected?Material.Green:Material.primaryTextColor
}
