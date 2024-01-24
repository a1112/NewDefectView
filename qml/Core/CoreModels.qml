import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../Base"
Item {
    id:root
    property var listColorList: [
        "#FFF",
        Material.color(Material.Green),
        Material.color(Material.Blue),
        Material.color(Material.Green),
        Material.color(Material.LightBlue),
        Material.color(Material.LightGreen),
        Material.color(Material.Yellow)
    ]
    property int listColorListCurrentInt: 0
    property var listColorDict: {
        return {}
    }
    function getListColor(steelID){
        return listColorDict[steelID.substr(0,10)]
    }
    function getSteelId(steelID){

        return steelID.substr(0,10)
    }

//    function getColorBySteelNo(steelNo){
//        if(coreConfig.listFold){
//        for(let i=model.count-1;i>=0 ;i--){
//            let st_id = getSteelId(model.get(i).steelNo)
//            if (st_id in listColorDict){
//                return listColorDict[st_id]
//            }
//            else{
//                listColorDict[st_id]=listColorList[listColorListCurrentInt]
//                listColorListCurrentInt++
//                if(listColorListCurrentInt>=listColorList.length){
//                    listColorListCurrentInt=1
//                }
//            }
//            return listColorDict[st_id]
//        }
//    }
//    }

    function getColorBySteelNo(steelNo){
        if(coreConfig.listFold){
            let st_id = getSteelId(steelNo)
            if (st_id in listColorDict){
                return listColorDict[st_id]
            }
            else{
                listColorDict[st_id]=listColorList[listColorListCurrentInt]
                listColorListCurrentInt++
                if(listColorListCurrentInt>=listColorList.length){
                    listColorListCurrentInt=1
                }
            }
            return listColorDict[st_id]
        }

    }


    property ListModel realListModel: ListModel{
        dynamicRoles:true
        onCountChanged: {
        }
    }
    property ListModel searchListModel: ListModel{
        dynamicRoles: true
        onCountChanged: {
//            if(coreConfig.listFold){
//            for(let i=searchListModel.count-1;i>=0 ;i--){
//                let st_id = getSteelId(searchListModel.get(i).steelNo)
//                if (st_id in listColorDict){
//                    return
//                }
//                else{
//                    listColorDict[st_id]=listColorList[listColorListCurrentInt]
//                    listColorListCurrentInt++
//                    if(listColorListCurrentInt>=listColorList.length){
//                        listColorListCurrentInt=1
//                    }
//                }
//            }
//        }
        }
    }

    property int realViewType: 0
    property int searchViewType: 1
    property int listViewType: 0    // 类别 0 实时， 1  查询
    readonly property bool isRealViewType: realViewType ==listViewType

    property ListModel realDefectItemModel: ListModel{
        dynamicRoles:true
        //        ListElement{
        //            defectID:10
        //            defectX:100
        //            defectY:300
        //            defectWidth:20
        //            defectHeight:40
        //            defectSource:""
        //        }
    }
    function steelClear(){ //清理
        defectListDialogDict={}
    }
    property ListModel mainListModel:listViewType==0?realListModel:searchListModel
    property ListModel currentDefectItemModel:realDefectItemModel
    property var defectListDialogDict: {return{}}   //  根据缺陷类别，表面，记录缺陷
    property var defectDict: {return {}}    // id,name,color    缺陷  LIST
    property var defectDictModel:ListModel{


    }
    property var defectShowDict: {return {}}
    property var defectListModelDict: {return {}}   // 缺陷计数
    property ListModel defectListModel: ListModel{  // 用于统计各缺陷 数量
        ListElement{
            defectName:"精轧辊印"
            show_color:"#F20801"
            code:1
            upCount:2
            downCount:3
        }
    }

    property var hostListModels: [
        {
            hostname:"10.9.55.253",
            port:809,
            protocol:"http://",
            msg:"2250 服务器"
        },
        {
            hostname:"10.9.58.180",
            port:809,
            protocol:"http://",
            msg:"热处理"
        },
        {
            hostname:"127.0.0.1",
            port:809,
            protocol:"http://",
            msg:"本地测试"
        }]
    property int hostIndex: 0



    SettingsBase{
        category:"hostConfig"
        property alias hostListModels: root.hostListModels
        property alias hostList: root.hostIndex
    }
    property ListModel upWidthModel: ListModel{
        dynamicRoles: true
    }
    property int downCameraCount: 2
    property int upCameraCount: 2
    property ListModel downWidthModel: ListModel{
        dynamicRoles: true
    }


    property string unitType: "m"
}
