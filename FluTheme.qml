

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
Item {
    property bool  isDark : false
    property color  primaryColor :Material.color(Material.primaryColor)
    Label {
    id:lib
    }
    property color  backgroundColor : Material.backgroundColor
    property color  windowBackgroundColor:Material.backgroundColor
    property color  windowActiveBackgroundColor:Material.color(Material.backgroundColor)
    property color  fontPrimaryColor:lib.color
    property color  fontSecondaryColor:Material.color(Material.secondaryTextColor)
    property color  fontTertiaryColor:Material.color(Material.textSelectionColor)
    property color  itemNormalColor:Material.color(Material.primaryTextColor)
    property color  itemHoverColor:Material.color(Material.primaryHighlightedTextColor)
    property color  itemPressColor :Material.color(Material.primaryTextColor)
    property color  itemCheckColor:Material.color(Material.primaryTextColor)

}


