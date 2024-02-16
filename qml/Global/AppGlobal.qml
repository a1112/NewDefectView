import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Base"
/*
    app global
*/
Item {
    id:root
    /* 软件类型 0：图像分析控制台，1：缺陷分析控制台，2：轮廓程序 */
    property int appType: 0
    property var appTypeAll: [
        appGlobal.imageType,appGlobal.defectType,
        appGlobal.steelLevelType,appGlobal.classifierType
    ]

    readonly property int imageType: 0   // 图像 分析控制台
    readonly property int defectType: 1  // 缺陷分析控制台
    readonly property int outLineType: 2 // 轮廓分析控制台
    readonly property int classifierType: 3     // 分类器控制台
    readonly property int minImageDefectType: 4 // 缺陷小图模式
    readonly property int steelLevelType: 5    //  判级程序
    readonly property string app_title:appType==0?"图像分析控制台"
                                      :appType==1?"缺陷分析控制台"
                                      :appType==2?"轮廓程序"
                                      :appType==3?"分类器控制台"
                                      :appType==4?"缺陷小图模式"
                                      :"判级模式"
SettingsBase{
    category: "global"
    property alias appType: root.appType
}
}
