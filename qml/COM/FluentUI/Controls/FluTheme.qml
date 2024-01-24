pragma Singleton

import QtQuick 2.15
import QtQuick.Controls.Material 2.15
Item {
    property bool  dark : false
    property color  primaryColor :Material.color(Material.primaryColor)

    property color  backgroundColor : Material.backgroundColor
    property color  windowBackgroundColor:Material.backgroundColor
    property color  windowActiveBackgroundColor:isDark ? Qt.rgba(26,26,26,255) : Qt.rgba(243,243,243,255)
    property color  fontPrimaryColor:isDark ? Qt.rgba(248,248,248,255) : Qt.rgba(7,7,7,255)
    property color  fontSecondaryColor:isDark ? Qt.rgba(222,222,222,255) : Qt.rgba(102,102,102,255)
    property color  fontTertiaryColor:isDark ? Qt.rgba(200,200,200,255) : Qt.rgba(153,153,153,255)
    property color  itemNormalColor:isDark ? Qt.rgba(255,255,255,0) : Qt.rgba(0,0,0,0)
    property color  itemHoverColor:isDark ? Qt.rgba(255,255,255,255*0.03) : Qt.rgba(0,0,0,255*0.03)
    property color  itemPressColor :isDark ? Qt.rgba(255,255,255,255*0.06) : Qt.rgba(0,0,0,255*0.06)
    property color  itemCheckColor:isDark ? Qt.rgba(255,255,255,255*0.09) : Qt.rgba(0,0,0,255*0.09)
    property color  fontPrimaryColor : Material.primaryTextColor
}


