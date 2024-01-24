import QtQuick 2.15
import "../Base"
Item {
    id:root
    property int initMainListNum: 100   //  初始化加载的项
    property int maxMainListNum: 500
    property real ypes: 0.6            // mm/像素
    property real xStretchFactor: 2 // x 方向的缩放
    property real yStretchFactor: 1//Y 方向的缩放
    property int imageWidth: 4096
    property int imageHeight: 1024
    readonly property real aspectRatio: imageHeight/imageWidth
    property bool listFold: true
    property int maxListCount: 500 // 最大的保存数量
    property string productionCode: "LG2250"

    property bool defectViewShowImageModel: false

    SettingsBase{
        property alias productionCode: root.productionCode
//        property alias initMainListNum: root.initMainListNum
        property alias maxMainListNum: root.maxMainListNum
        property alias ypes: root.ypes
        property alias xStretchFactor: root.xStretchFactor
//        property alias yStretchFactor: root.yStretchFactor
        property alias imageWidth: root.imageWidth
        property alias imageHeight: root.imageHeight
    }
}
