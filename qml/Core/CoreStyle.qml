import QtQuick 2.15
import QtQuick.Controls.Material 2.15
import "../Style"
Item {
    property string iconUrl: "qrc:///qml/resource/icon/"
    property int theme: Material.Dark//Light .Dark
    readonly property bool isDark: theme===Material.Dark

    property var foreground: Material.foreground

//    property color background:

    function getIcon(iconName){
        return iconUrl+iconName
    }
    function getStyleIcon(iconName,theme){
        return getIcon(iconName)+(isDark?"_Dark":"_Light")
    }
    function changeStyle(){
        // 切换状态
        if (theme===Material.Dark){
            theme = Material.Light
        }
        else{
            theme = Material.Dark
        }
    }
    property LeftInfoStyle leftInfoStyle: LeftInfoStyle{}
}
