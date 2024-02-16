import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../Sql/Obj"
Column{
    id:root
    property int visCount: 1
    property int maxItemHeight: (root.height-(defCount*30))/Math.max(1,visCount)+30
    property int defCount: 0
    property ListModel defctsModel: viewMoels.defctsModel
    property Sql_Defect sql_Defect: Sql_Defect{}
    function clearAll(){
        for (let i=0;i<viewMoels.defectDictModel.count;i++)
        {
            let item = rep.itemAt(i)
            item.clear_()
        }
    }
    function addAll(){
        var defList=[]

        for (let i=0;i<defctsModel.count;i++)
        {
            let defect = defctsModel.get(i)
            steelLevelCore.addDefectGrade(topIndex,defect.grade)
            if (defList.indexOf(defect.defectID)<0){
            defList.push(defect.defectID)
            }
            let item = rep.itemAt(defect.defectID)
            sql_Defect.init_sql(defect)
            item.append_(sql_Defect.toDict())
        }
        defCount = defList.length
    }

    function shrinkDefectList_(){
        steelLevelCore.visDefectClass=-1
    }

    Timer{
        id:upDefectT
        interval: 333
        onTriggered: {
            clearAll()
            addAll()
            let old=steelLevelCore.gradesDict
            steelLevelCore.gradesDict=[]
            steelLevelCore.gradesDict=old

        }
    }
    Connections{
        target: defctsModel
        function onCountChanged(){
            steelLevelCore.gradesDict=[]
            upDefectT.restart()
        }
    }
    clip: true
    width: parent.width
    height: parent.height
    Column{
        width: parent.width
        spacing: 0
        Repeater{
            id:rep
                model: viewMoels.defectDictModel
            DefectItemList{
            width:root.width
            }
        }
    }
function flushItemsView(){
           defectListCore.itemViewHasVis=false
    for (let i=0;i<defctsModel.count;i++)
    {
        let defect = defctsModel.get(i)
        let item = rep.itemAt(defect.defectID)
        if (item.itemView){
            defectListCore.itemViewHasVis=true
        }
    }
}
Component.onCompleted: {
    defectListCore.shrinkDefectListFunc=shrinkDefectList_
}

}

