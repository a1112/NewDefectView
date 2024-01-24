import QtQuick 2.15
//  core by level
import "../Sql/Obj"
import "../Core"
Item {

    property int visDefectClass: -1

    property int selectTopIndex:0
    property Sql_Defect selectDefect: Sql_Defect{
    }

    property bool defectHoved: false    // 存在悬停

    property var steelLevelModel: [1,2,3]


    property var selectSteelModel: {
        let re=[]
        steelLevelModel.forEach((index,v)=>{
                re[index]=true
                                })
        return re
    }
    function flushSelectSteelModel(){
        let old=selectSteelModel
        selectSteelModel=[]
        selectSteelModel=old
    }

    property var checkDefectClasses: []

    property ItemMoels selectViewMoels:selectTopIndex===0?coreState.topMoels:coreState.bottonMoels

    function setAcTiveSelect(topIndex){
        let selectI = topIndex===0?coreState.topMoels:coreState.bottonMoels
        let unselectI = topIndex===1?coreState.topMoels:coreState.bottonMoels
        selectI.slectDefect=true
        unselectI.slectDefect=false
    }

    function setSelectDefect(model,index,tpIndex){
        selectTopIndex=tpIndex
        steelLevelCore.defectListModel = model
        steelLevelCore.currentIndex=index
    }
    property int currentDefectClass: 0 // 当前的缺陷索引号
    property int currentDefectNo: 0
    property int currentDefectIndex: 0
    readonly property string currentDefectName: control.getNameById(currentDefectClass)
    readonly property color currentDefectColor: control.getColorById(currentDefectClass)

    property string currenctmaxImageSource:""  // 大图的 source
    property var defectCanViewList: []  // 显示的缺陷种类
    property bool hasDefectView: true

    onDefectCanViewListChanged: {
        for (let index=0; index<defectCanViewList.length;index++){
            let i = defectCanViewList[index]
            if (i)
            {    hasDefectView=true
            return
            }
            hasDefectView=false
        }
    }

    function viewAlldefect(){//显示全部
        defectCanViewList=[1]
         defectCanViewList=[]
    }
    function disViewDefect(){//隐藏全部
        defectCanViewList=[]
        for (let index=0; index<coreModels.defectDictModel.count;index++){
            let obj = coreModels.defectDictModel.get(index)
            defectCanViewList[obj.id]=0
        }
        updata_defectCanViewList()
    }


    function updata_defectCanViewList(){
            let old = defectCanViewList
            defectCanViewList=[]
            defectCanViewList=old
        }


    property ListModel currentImageObjects:ListModel{
                    dynamicRoles:true
                    } // 当前缺陷

    property int resize: 4096

    function setImageSource(cameraIndex,seqNo,imageIndex){
        currenctmaxImageSource=api.getCimg(cameraIndex,seqNo,imageIndex,resize)
    }

    function setImageObj(item){
        let selectDefect = steelLevelCore.selectDefect
        currentImageObjects.clear()
        currentImageObjects.append(selectDefect.toDict())
    }

    function selectNextImage(y){


        if (y>0){
            if(currentIndex<defectListModel.count-1)
            currentIndex+=1
        }
        else{
            if(currentIndex>0)
            currentIndex-=1
        }

    }
    property int selectModelIndex: 0    // 选中列表的
    property ListModel allDefectModel: selectTopIndex==0?coreState.topMoels.defctsModel:coreState.bottonMoels.defctsModel
    property ListModel defectListModel
    readonly property bool isAllDefectModel: allDefectModel==defectListModel

    property int currentIndex: 1
    onCurrentIndexChanged: {
        let item=steelLevelCore.defectListModel.get(currentIndex)
        steelLevelCore.currentDefectClass=item.defectID
        steelLevelCore.currentDefectNo=item.defectNo
        steelLevelCore.selectDefect.defectID=item.defectID
        steelLevelCore.selectDefect.defectX=item.defectX
        steelLevelCore.selectDefect.defectY=item.defectY
        steelLevelCore.selectDefect.defectWidth=item.defectWidth
        steelLevelCore.selectDefect.defectHeight=item.defectHeight
        steelLevelCore.selectDefect.boxX=item.boxX
        steelLevelCore.selectDefect.boxY=item.boxY
        steelLevelCore.selectDefect.boxW=item.boxW
        steelLevelCore.selectDefect.boxH=item.boxH
        steelLevelCore.selectDefect.cameraId=item.cameraId
        steelLevelCore.selectDefect.imageIndex=item.imageIndex
        steelLevelCore.selectDefect.defectNo=item.defectNo
        steelLevelCore.setImageSource(item.cameraId,item.seqNo,item.imageIndex)
        steelLevelCore.setImageObj(steelLevelCore.selectDefect)
    }

    property var gradesDict: []

    function addDefectGrade(tp__index,grade){
        if(grade in gradesDict){
            gradesDict[grade]+=1
        }
        else{
            gradesDict[grade]=1
        }
    }

    property real minCanVasScale:minCanVasLen/maxCanVasLen
    property real maxCanVasScale: 1.0

    property real canVasScale: 1.0
    property real maxCanVasLen:itemWidth*(coreState.topMoels.imageHeight/coreState.topMoels.imageWidth)
    property real minCanVasLen:canHeight/maxLenCount
    property int maxLenCount: Math.max(coreState.topMoels.imageCount,coreState.bottonMoels.imageCount)
    property real currentCanVasLen: maxCanVasLen*canVasScale

    property real canVisDefectLabel: currentCanVasLen>20


    property real canHeight: 100

    property real itemWidth: 100



    property real cellWidthScale: 1.0

    property bool maxListView: false  // 最大化

    property real minOutSideH: 100    //
    property real minOutSideW: 100    //
    property real outSize: 10
    function getNewRec(x,y,w,h){
        let outW=Math.max(minOutSideW,w+outSize)
        let outH=Math.max(minOutSideH,h+outSize)
        return [x-(outW-w)/2, y-(outH-h)/2, outW, outH]
    }

}
