import QtQuick 2.15
    // 切换 全屏等
ColorItemDelegateButtonBase{
    tipText:qsTr("全屏/取消全屏")
    height: parent.height
    width: height
    property bool shouMaxIcon: true
    source:shouMaxIcon?coreStyle.getIcon("FullScreen"):coreStyle.getIcon("WindowScreen")
}
