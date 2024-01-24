import QtQuick 2.15
import QtQuick.Controls 2.15
ListVieBase {
    currentIndex:coreState.currentSteelIndex
    onCurrentIndexChanged: {
    if(coreState.currentSteelIndex==coreModels.mainListModel.count-1){
        list.positionViewAtEnd()
    }
    }
    spacing: 0.05*dpi
    id:list
    model: coreModels.mainListModel

    verticalLayoutDirection:ListView.BottomToTop
    width: 100
    delegate:
        ListMainViewItem{
        width: list.width
        height: 0.8*dpi
    }
    highlightMoveDuration:200
    highlight:Item{
    Rectangle {
        color: "#2196F3"; width: 0.1*dpi
        height: parent.height
    }
    }
    Component.onCompleted: {
        coreObj.mainListView=list
    }
    /*
{
        "steelNo": fake.phone_number(),  # 钢板号
        "steelType": fake.job(),  # 钢种
        "steelLength": 12.5,  # 长度 米
        "steelWidth": 3.6,  # 宽度 米
        "upDefectNum": random.randint(0, 10),  # 上表面缺陷数量
        "downDefectNum": random.randint(0, 10),  # 下表面缺陷数量
        "errorLevel": random.randint(0, 3)  # 0:正常，1：警告，2：报警，3：严重报警
        # 后续补充
    }


*/
}

