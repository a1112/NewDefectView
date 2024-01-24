import QtQuick 2.15

Item {
    property rect selectRec: Qt.rect(0,0,0,0)
    property var selectList: {return {}}
    property ListModel selectCountModel: ListModel{
        dynamicRoles: true
    }
    function addSeleceCountData(obj){//添加选择的缺陷
        let uped=false
        for(let i=0;i< selectCountModel.count;i++){
            //        ListElement{
            //            defectID:10
            //            defectX:100
            //            defectY:300
            //            defectWidth:20
            //            defectHeight:40
            //            defectSource:""
            //        }
            let defectData =selectCountModel.get(i)
            if(defectData.defectID===obj.defectID){
                selectCountModel.setProperty(i,"count",defectData["count"]+1)
                uped=true
                break
            }
        }
        if(!uped){
            selectCountModel.append({"defectID":obj["defectID"],
                                  "count":1
                              })
        }
    }
    function delSeleceCountData(obj){
        for(let i=0;i< selectCountModel.count;i++){
            let defectData =selectCountModel.get(i)
            if(defectData.defectID===obj.defectID){
                selectCountModel.setProperty(i,"count",defectData["count"]-1)
                if(selectCountModel.get(i).count<=0)
                    selectCountModel.remove(i)
                break
            }

        }

    }
    function clearAll(){
         selectRec= Qt.rect(0,0,0,0)
        selectCountModel.clear()
        selectList={}
    }
}
