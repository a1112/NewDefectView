import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../Labels"
Item {
    Layout.fillWidth: true
    Layout.fillHeight: true
    property int currentSettingIndex: 0
    property var defectDict: {
        return {}
    }

    property var defectLevelData: {
        return {}

    }
    property var steelLevelData: {
        return {}
    }
    property int steelTypeIndex:currentDefectIndex
    property var currentLevelData: {
    }

    property ListModel defectModel: ListModel{
    }

    property ListModel steelModel: ListModel{

    }


    property var defectInfoData: {
        return {}
    }
    property ListModel defectInfoModel: ListModel{


    }

    function listToString(list_){
        return  +list_[0]+"\n"+
                "长度范围："+list_[1]+"\n"+
                "宽度范围："+list_[2]+"\n"+
                "面积范围："+list_[3]
    }
    function initDefectData(){
        defectModel.clear()
        for (let key in defectLevelData) {
            let value = defectLevelData[key]
            value["levelNsg_L"]=listToString(value["L"])
            value["levelNsg_M"]=listToString(value["M"])
            value["levelNsg_S"]=listToString(value["S"])
            defectModel.append(value)
        }
        steelModel.clear()
        for (let key_ in steelLevelData) {
            let value = steelLevelData[key_]
            value["levelNsg_Level"]=listToString(value["1"])
            value["levelNsg_T"]=listToString(value["2"])
            value["levelNsg_B"]=listToString(value["3"])
            steelModel.append(value)
        }

        defectInfoModel.clear()
    }

    onSteelTypeIndexChanged: {
        currentLevelData = coreModels.defectTabelData[steelTypeIndex]
        steelLevelData = currentLevelData["steelLevel"]
        defectLevelData = currentLevelData["defectLevel"]
        initDefectData()
    }
    ColumnLayout{
        anchors.fill: parent

        TabBar {
             id: bar
             currentIndex: currentSettingIndex
             onCurrentIndexChanged: {
                currentSettingIndex = currentIndex
             }
             TabButton {
                 width: 120
                 text: qsTr("缺陷判级")
             }
             TabButton {
                 width: 120
                 text: qsTr("物料判级")
             }
             TabButton {
                 width: 120
                 text: qsTr("对照表")
             }
         }

        RowLayout{
            Layout.fillWidth: true
            Item{
                Layout.fillWidth: true
        TitleLabel {
            Material.foreground: Material.Green
            text: currentLevelData["name"]
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 20
        }
            }

        }
        SwipeView{
            currentIndex: currentSettingIndex
            onCurrentIndexChanged: {
               currentSettingIndex = currentIndex
            }
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            DefectSettingTabel{
            }
            SteelSettingTabel{
            }
            DefectInfoTabel{

            }

        }

}
}
