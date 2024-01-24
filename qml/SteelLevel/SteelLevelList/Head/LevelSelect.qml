import QtQuick 2.15
import QtQuick.Controls 2.14
Row {
    property var steelLevelList: [0,0,0,0,0]

    Button{
        height: 30
        text: "全选"
        onClicked: {
                    steelLevelList=[]
        }

    }

    Timer{
        id:ti
        interval: 1000
        onTriggered: {
            steelLevelList=[0,0,0,0,0]
            for(let i = 0;i< coreModels.mainListModel.count;i++){
                let obj=coreModels.mainListModel.get(i)

                steelLevelList[obj.grade??1]+=1
            }
            let old=steelLevelList
            steelLevelList=[]
            steelLevelList=old
        }
        property int steelCount: coreModels.mainListModel.count
        onSteelCountChanged: {
        ti.restart()
        }
    }

    Repeater{
        model: steelLevelCore.steelLevelModel
        CheckDelegate{
        text: modelData + "级"+"("+steelLevelList[modelData]+")"
        height: 25
        checked: steelLevelCore.selectSteelModel[modelData]
        onCheckedChanged: {
            steelLevelCore.selectSteelModel[modelData]=checked
            steelLevelCore.flushSelectSteelModel()
        }
        }
}

}
