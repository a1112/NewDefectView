import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    property int mainPageIndex: 0
    property int currentSteelIndex: 0
    readonly property int mainListCount: coreModels.mainListModel.count
    property var currentMainListModelItem: coreModels.mainListModel.count?
                                               coreModels.mainListModel.get(currentSteelIndex):
                                               {
                                                   currentSteelId:0,
                                                   currentSteelNo:"0",
                                                   steelNo:"",
                                                   steelID:0
                                               }
    readonly property string currentSteelNo: currentMainListModelItem===undefined?
                                                 "":currentMainListModelItem.steelNo//当前 的 钢板号
    readonly property int currentSteelId: currentMainListModelItem.steelID===undefined?0:currentMainListModelItem.steelID
    readonly property bool hasPreSteel:currentSteelIndex>0
    readonly property bool hasNextSteel: coreModels.mainListModel.count-1>currentSteelIndex
    property bool isRealSteel: !hasNextSteel && coreModels.isRealViewType
    property bool defectOnly: false // 选中了仅缺陷
    onCurrentSteelIdChanged: {
        imShowStartIndex=0  // 刷新显示位置
        coreModels.steelClear()
        control.getWidths(currentSteelId)
        control.refreshDefectViewBySteelId(currentSteelId)  // 更新当前缺陷视图
        control.refreshUserDefectViewBySteelId(currentSteelId)
        //        coreObj.refush()
    }

    property ItemMoels topMoels: TopMoels{
    }
    property ItemMoels bottonMoels: BottonMoels{
    }
    property bool realAutoType: true
    property int realTime: 600
    Timer{
        id:realTime_id
        running: !realAutoType
        interval: 5000
        repeat: true
        onTriggered: {
            realTime-=1
            if(realTime<1){
                realAutoType=true
            }
        }
    }
    function flushAuto(){
        realAutoType=false
        realTime=600
        realTime_id.restart()
    }

    property int steelContentX: 0
    property real steelContentW: 10
    property real imShowStartIndex: 0   // 通过改变该值 改变位置信息
    property bool activeImShowStartIndexChangeAnim: true
    Behavior on imShowStartIndex{
        enabled:activeImShowStartIndexChangeAnim
        NumberAnimation{duration: 300}}
    property real imCanShowCount: 10

    property real defectViewDrawHeight: 0   // 绘制的高度
    property real defectViewDrawWidth: 0    // 绘制的宽度
    property real showStartX: 0
    readonly property real showEndX: showStartX+defectViewDrawWidth
    //              ---
    property var lastSteelObj:{
        return {}
    }
    property bool detState: lastSteelObj.topLen===0       // 当前是否正在检测

    property int maxUpImageCount: 0     //上表面 数量
    property var upImageWidthInfoList: []   //  上表面宽度文件
    onUpImageWidthInfoListChanged: {
        if (!isRealSteel || !coreModels.upWidthModel.count){
            coreModels.upWidthModel.clear()
            maxUpImageCount=0
            upImageWidthInfoList.forEach((value,index)=>{coreModels.upWidthModel.append(value)})
            coreModels.upCameraCount=coreModels.upWidthModel.count
        }
        upImageWidthInfoList.forEach((value,index)=>{
                                         if(value.imageCount>maxUpImageCount)
                                         maxUpImageCount=value.imageCount
                                     })
    }
    property int maxDownImageCount: 0
    property var downImageWidthInfoList: []
    property int maxMaxImageCount: Math.max(maxUpImageCount,maxDownImageCount)
    onDownImageWidthInfoListChanged: {
        if (!isRealSteel || !coreModels.downWidthModel.count){
            maxDownImageCount=0
            coreModels.downWidthModel.clear()
            downImageWidthInfoList.forEach((value,index)=>{coreModels.downWidthModel.append(value)})
            coreModels.downCameraCount=coreModels.upWidthModel.count
        }
        downImageWidthInfoList.forEach((value,index)=>{
                                           if(value.imageCount>maxDownImageCount)
                                           maxDownImageCount=value.imageCount
                                       })
    }

    property int  maxImageCount: 100  // 当前图像的最大值

    property bool searchByDefectEnable: false
    property var searchDefectDict: {return {}}
    property bool visibleDefectPieCharts: true
    property bool isCHmodel: false
    property int currentImageMoveModel: 0
    property int imageScrollModel: 0        // 滚动时
    property int imageChangeModel: 1        // 跳转式
    property real changeHeightSpeed: 0.75

    property real imageZoom: 1          // 图像缩放比例

    property bool imageShowBolderView: false
}
