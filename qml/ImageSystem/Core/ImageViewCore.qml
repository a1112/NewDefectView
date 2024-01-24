import QtQuick 2.15
import "../../Base"
Item {
    id:root
    property int currentListViewModel: showListViewModel
    readonly property int showListViewModel: 0
    readonly property int hideListViewModel: 1
    function changeListViewModel(){
        currentListViewModel=currentListViewModel==showListViewModel?hideListViewModel:showListViewModel
    }
    property var imageWidthInfoList:isTopOnly? coreState.upImageWidthInfoList:coreState.downImageWidthInfoList// 宽度文件

    property int layoutType: 1
    readonly property int layoutHorizontal:Qt.Horizontal
    readonly property int layoutVertical: Qt.Vertical
    readonly property int layoutTop:Qt.AlignTop
    readonly property int layoutBottom:Qt.AlignBottom
    property bool isHorizontal: layoutType===layoutHorizontal
    property bool isVertical: layoutType===layoutVertical
    readonly property bool isTopOnly: layoutType===layoutTop
    readonly property bool isBottomOnly: layoutType===layoutBottom
    property int layoutOld: layoutHorizontal
    property int globalContentY: 0

    property int focusItem: 0
    property int linkX: 1
    property bool imageSystemCanViewDefect: true    // 图像视图允许显示缺陷
    property bool autoShowMaxImageView: true        // 自动弹出显示
    property bool showDefectText: true              // 显示缺陷文本
    property bool imageCrossView: false             // 十字坐标
    property bool imageScaleView: true            // 刻度

    // 临时值
    property int cacameraIndex: 0
   property int imageIndex: 0

    property int menu_cacameraIndex: cacameraIndex
   property int menu_imageIndex: imageIndex

    property bool menuVisible: false            // 菜单是否可见


    readonly property bool is_imageMarkDefect: imageShowModel== imageCrateDefectModel           // 标记缺陷

     property int imageShowModel: imageViewModel

        readonly property int imageViewModel: 11
    readonly property int imageCrateDefectModel: 12


    onIs_imageMarkDefectChanged: {
        if(!is_imageMarkDefect){
                coreState.currentImageMoveModel=coreState.imageScrollModel}
    }
    property bool topCanVisible: coreModels.upWidthModel.count&&!imageViewCore.isBottomOnly
    property bool bottomCanVisible: coreModels.downWidthModel.count&&!imageViewCore.isTopOnly
    property Flickable flickA
    property Flickable flickB

    property int minImageViewSpeed: 1500
    property int imageViewSpeed: 2600
    SettingsBase{
        property alias imageViewSpeed: root.imageViewSpeed
    }
    property int maxImageViewSpeed: 8000
    property int imageViewSpeedStepSize: 200
    property bool listHovered: false

}
