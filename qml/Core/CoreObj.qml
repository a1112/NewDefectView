import QtQuick 2.15
//import QtCharts 2.15
import "../MainShow/DefectShow"
import "../DefectNavigationView"
import "../ListShowView"
Item {
    property ListMainView mainListView
    property DefectShowMainItem defectShowViewDown
    property DefectShowMainItem defectShowViewUp
    property DefectNavigationViewitem defectNavigationViewitemDown
    property DefectNavigationViewitem defectNavigationViewitemUp
    property int maxShowimageNum:50  //Math.max(defectNavigationViewitemDown.maxShowimageNum,defectNavigationViewitemUp.maxShowimageNum)
    property ListModel upDefctsModel: ListModel{}
    property var upWidthData: []
    property var downWidthData: []
    property var upDefcts
/*
{"steelLeft":[-1136,-1142,-1147,-1138,-1142,-1132,-1123,-1127,-1133,-1135,-1122,-1122,-1121,-1141,-1125],
"steelRight":[-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47],
"imageIndex":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]}
*/

    function updata_widths(data){
        return data["widthInfo"]
    }

    onUpDefctsChanged: {
        upDefctsModel.clear()
        for(let index in upDefcts["defectList"]){
            upDefctsModel.append(upDefcts["defectList"][index])
        }
        upWidthData=updata_widths(upDefcts["steelInfo"])

    }
    property ListModel downDefctsModel: ListModel{}


    property var downDefects
    onDownDefectsChanged: {
        downDefctsModel.clear()
        for(let index in downDefects["defectList"]){
            downDefctsModel.append(downDefects["defectList"][index])
        }
        downWidthData=updata_widths(downDefects["steelInfo"])
    }

//    function refush(){
//        defectShowViewDown.refush()
//        defectShowViewUp.refush()

//    }

        property ListModel upUserDefctsModel: ListModel{}
    property var upUserDefcts
    onUpUserDefctsChanged: {
        upUserDefctsModel.clear()
        for(let index in upUserDefcts["defectList"]){
            let defectOne = upUserDefcts["defectList"][index]
            upUserDefctsModel.append({
                                         defectID:defectOne.defectId,
                                         boxX:defectOne.x,
                                         boxY:defectOne.y,
                                         boxW:defectOne.w,
                                         boxH:defectOne.h
                                     })
           // {"seqNo":1234,"y":10,"h":200,"isTop":1,"info":null,"w":200,"id":1,"x":10,"defectId":1}
        }
    }
    property ListModel downUserDefctsModel: ListModel{}
    property var downUserDefects
    onDownUserDefectsChanged: {
        downUserDefctsModel.clear()
        for(let index in downUserDefects["defectList"]){
            let defectOne = downUserDefects["defectList"][index]

            downUserDefctsModel.append({
                                           defectID:defectOne.defectId,
                                           boxX:defectOne.x,
                                           boxY:defectOne.y,
                                           boxW:defectOne.w,
                                           boxH:defectOne.h
                                       })
        }
    }

}
