import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    // 计划任务

    Timer{  // 计划任务： 查询当前数据更新状态
        running: true
        interval: 1000
        repeat: true
        onTriggered: {
            if (coreModels.realListModel.count){
            control.getAppFlush(
                        coreState.currentSteelId,
                        coreModels.realListModel.get(coreModels.realListModel.count-1).id
                        )

            }
        }

    }
    Timer{
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            if(coreState.isRealSteel){
                control.getWidthFlush(coreState.currentSteelId)

            }
        }

    }


    Timer{  //刷新检测状态
        interval: 2000
        running:true
        repeat: true
        onTriggered: {
            if (coreModels.realListModel.count){
                control.getRealInfoById(coreModels.realListModel.get(coreModels.realListModel.count-1).id)
            }
        }
    }

}
