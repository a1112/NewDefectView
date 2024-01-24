import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
//import QtCharts 2.15
import "../../Menus"
import "Core"
import "../../charts"
import "../../btns"
import "../../Base"
Item {
    id:defectShowViewroot
    Layout.fillWidth: true
    Layout.fillHeight: true

    property DefectViewCore defectViewCore: DefectViewCore{}
    property DefectViewState defectViewState: DefectViewState{}
    property DefectViewControl defectViewControl: DefectViewControl{}
    property bool isUpSurface: true
//    property LineSeries outLineSeriesUp
//    property LineSeries outLineSeriesDown
    property int otherImageModel: 0
    property int currentSteelId: coreState.currentSteelId
    onCurrentSteelIdChanged: {
        otherImageModel=0
        refush()
    }

    property string currentMaxImageSource: ""
//    property PieSeries pieSeries
    property ListModel defectViewModel :ListModel{
    dynamicRoles:true
        //        ListElement{
        //            defectID:10
        //            defectX:100
        //            defectY:300
        //            defectWidth:20
        //            defectHeight:40
        //        }
    }

    function showOtherView(defectIndex){
        selectDefectIndex=defectIndex
        otherImageModel=1
    }

    function setChiceByIndex(defectIndex){
        selectDefectIndex=defectIndex
        otherImageModel=1
    }

    property int hoveredDefectIndex: -1//当前悬停的缺陷 index
    property int selectDefectIndex: 0
    function preSelectDefectItem(){// 获取上一个缺陷，除去隐藏的
        if(selectDefectIndex>0){
            selectDefectIndex-=1
        }
    }
    function nextSelectDefectItem(){// 获取下一个缺陷
        if (selectDefectIndex<defectViewModel.count-1){
            selectDefectIndex+=1
        }
    }

    function selectNextImage(direction){
        let currentCamera=selectDefectObj.cameraId
        let currentIndex=selectDefectObj.imageIndex
        let i =selectDefectIndex
        if(direction>0){
            for( i;i<defectViewModel.count-1;i++ ){
                if (defectViewModel.get(i).cameraId!==currentCamera ||defectViewModel.get(i).imageIndex!==currentIndex)
                {
                    selectDefectIndex=i
                    return
                }
            }
        }
        else{
            for(i;i>=0;i-- ){
                if (defectViewModel.get(i).cameraId!==currentCamera ||defectViewModel.get(i).imageIndex!==currentIndex)
                {
                    selectDefectIndex=i
                    return
                }
            }
        }
    }

    function moveToX(x_){
        // x 坐标移动
        if(x_>coreState.showEndX){
            coreState.imShowStartIndex=(x_-coreState.defectViewDrawWidth*0.7)/item_width
        }
        else if (x_<coreState.showStartX){
            coreState.imShowStartIndex=(x_-coreState.defectViewDrawWidth*0.3)/item_width
        }
    }

    readonly property var hoveredDefectObj: hoveredDefectIndex>=0?defectViewModel.get(hoveredDefectIndex):{}

    property DefectItemDelegate hoveredItem:{return {x:0,y:0,width:0,height:0}}
    property DefectItemDelegate selectItem:{return {x:0,y:0,width:0,height:0}}
    onSelectItemChanged: {
        if (selectItem){
            moveToX(selectItem.x)
        }
    }
    readonly property var selectDefectObj:  defectViewModel.get(selectDefectIndex)
    readonly property string currenctDefectImageSource: api.getImage(selectDefectObj.cameraId,selectDefectObj.defectNo)// 当前的缺陷图片
    readonly property string currenctmaxImageSource: api.getMaxImage(selectDefectObj.cameraId,selectDefectObj.seqNo,selectDefectObj.imageIndex)// 当前的完整图片
    property var defectDicts: {return{}}// cameraId  index
    onCurrenctmaxImageSourceChanged:{
        currentImageObjects.clear()
        let objs = defectDicts[selectDefectObj.cameraId][selectDefectObj.imageIndex]
        for(let i=0;i<objs.length;i++){
            currentImageObjects.append(objs[i])
        }
    }
    property ListModel currentImageObjects:ListModel{   //
        dynamicRoles:true
    }
    property int pixedSteelWidth: 0
    property int pixedSteelHeight: 0

    property int steelDrawHeight: pixedSteelHeight*y_scale
    property int steelDrawWidth: pixedSteelWidth*x_scale
    //    property int imageCount: 10
    readonly property real base_scale: defectShowViewroot.height/coreConfig.imageWidth/(cameraListMiodel.count?cameraListMiodel.count:1)
    readonly property real x_scale:base_scale*coreConfig.xStretchFactor
    readonly property real y_scale: base_scale*coreConfig.yStretchFactor
    readonly property real item_width: coreConfig.imageHeight*x_scale
    readonly property real item_height: coreConfig.imageWidth*y_scale
    function drawUpOutLine(outLineData){
        outLineSeriesUp.clear()
        for (let index in outLineData)
            outLineSeriesUp.append(outLineData[index][0],outLineData[index][1])
    }
    function drawDownOutLine(outLineData){
        outLineSeriesDown.clear()
        for (let index in outLineData)
            outLineSeriesDown.append(outLineData[index][0],outLineData[index][1])
    }
    function drawOutLine(outLineDataUp,outLineDataDown){
        drawUpOutLine(outLineDataUp)
        drawDownOutLine(outLineDataDown)
    }

    property var pieDict: {
    return {}
    }

    function addDefectToDefectListDialogDict(defectData,defectIndex){
        defectData["defectIndex"]=defectIndex
        let defectID = defectData.defectID
        let defectName = control.getNameById(defectData.defectID)
//        let pie = pieSeries.find(defectName)
        let pie
        if(defectName in  pieDict){
             pie = pieDict[defectName]
            pie.value=pie.value+1
        }
        else{
             pie = pieSeries.append(defectName,1)
            pieDict[defectName] = pie
            pie.labelVisible=true
            pie.labelFont.pointSize=12
            pie.color=control.getColorById(defectData.defectID)
            pie.labelColor = pie.color
        }
         pie.label=defectName+" "+pie.value
        if (!coreModels.defectListDialogDict[defectID])
            coreModels.defectListDialogDict[defectID]={}
        if (!coreModels.defectListDialogDict[defectID][isUpSurface+0])
            coreModels.defectListDialogDict[defectID][isUpSurface+0]=[]
        coreModels.defectListDialogDict[defectID][isUpSurface+0].push(defectData)
    }

    function appendDefectOnes(defectData){          // <<<<<<<<<<<<<<<<============================ 增加单个缺陷
        let defectID = defectData.defectID
        let cameraIndex = defectData.cameraId
        let imageIndex = defectData.imageIndex
        defectViewModel.append(defectData)  // 本地缺陷增加
        addDefectToDefectListDialogDict(defectData,defectViewModel.count-1)
        //  添加到 defectDicts key
        if(!(cameraIndex  in defectDicts)){
            defectDicts[cameraIndex]={}
        }
        if (!(imageIndex  in defectDicts[cameraIndex])){
            defectDicts[cameraIndex][imageIndex]=[]
        }
        defectDicts[cameraIndex][imageIndex].push(defectData)
        //  添加到预览统计
        if(defectID in coreModels.defectListModelDict){
            coreModels.defectListModel.setProperty(coreModels.defectListModelDict[defectID], isUpSurface?"upCount":"downCount",
                                                   coreModels.defectListModel.get(coreModels.defectListModelDict[defectID]).upCount+1)
        }
        else{
            coreModels.defectListModel.append({
                                                  defectName:control.getNameById(defectID),
                                                  show_color:control.getColorById(defectID),
                                                  code:defectID,
                                                  upCount:isUpSurface?1:0,
                                                  downCount:isUpSurface?0:1
                                              })
            coreModels.defectListModelDict[defectID]=coreModels.defectListModel.count-1
        }
        steelDetectionModel.setProperty(imageIndex,"defectCount",steelDetectionModel.get(imageIndex).defectCount+1)
    }

    function upDetectionNunView(){
        if (imageCount-steelDetectionModel.count>0){
            while(imageCount-steelDetectionModel.count>0)
            {
                steelDetectionModel.append({
                                               defectCount:0
                                           })
            }
        }
        else{
            while(steelDetectionModel.count-imageCount>0){
                steelDetectionModel.remove(steelDetectionModel.count-1)
            }
        }
    }

    property ListModel steelDetectionModel: ListModel{}       // 上表面 缺陷 LIST

    function refreshView(defectDatas){
        selectDefectIndex=0
        steelDetectionModel.clear()
        //        imageCount = defectDatas.steelInfo.imageCount
        upDetectionNunView()
        pieSeries.clear()
        pieDict={}
        defectViewModel.clear()
        pixedSteelWidth=defectDatas.steelInfo.drawWidth
        pixedSteelHeight=defectDatas.steelInfo.drawHeight  // 更新高度  虚拟
        drawOutLine(defectDatas.outLineUp,defectDatas.outLineDown)
        defectDicts={}
        for(let index in defectDatas["defectList"]){
            appendDefectOnes(defectDatas["defectList"][index])
        }
    }

    function refush(){
        defectViewState.clearAll()
    }
    DefectShowBgView{
        id:bg
        anchors.horizontalCenterOffset: 0.15*dpi
        anchors.centerIn: parent
        width: parent.width-0.8*dpi
        height: parent.height-0.25*dpi
        Item{
            anchors.centerIn: parent
            width: parent.width+0.1*dpi
            height: parent.height+0.1*dpi
            Item{
                anchors.right: parent.right
                width: 2.5*dpi
                height: width
                anchors.bottom: parent.bottom
//                DefectPieCharts{
//                    anchors.fill: parent
//                    visible: coreState.visibleDefectPieCharts
//                }
            }
            ScaleLineLabelX{
                anchors.bottom: parent.top
            }
            ScaleLineLabelY{
                anchors.right: parent.left
            }
            ScaleLineLabelR{
                anchors.left: parent.right
            }

        }
        DefectView{//   <---
            height: bg.height
            width: bg.width
        }
        ItemDelegate{
            width: 0.4*dpi
            height: width
            anchors.right: parent.right
            anchors.bottom: parent.bottom
        ColorImageButton{
            source: coreStyle.getIcon("pie")
            selected:coreState.visibleDefectPieCharts
        }
        onClicked: {coreState.visibleDefectPieCharts=!coreState.visibleDefectPieCharts
                    }
        }
    }
    WheelHandler{//切换选取的下一个缺陷index
        onWheel: (event)=> {
                     if (event.angleDelta.y/120>0){
                         preSelectDefectItem()
                     }
                     else{
                         nextSelectDefectItem()
                     }
                 }
    }
    MouseArea{
        anchors.fill: parent
        acceptedButtons:Qt.RightButton
        onClicked: {
            defectMenu.popup()
        }
    }
    DefectViewMenu{
        id:defectMenu
        onClickShowImageWindow:if(otherImageModel){otherImageModel=false}else showOtherView(selectDefectIndex)
        onCkickDefectImageModel:{   //开启原图模式

        }
    }
}
