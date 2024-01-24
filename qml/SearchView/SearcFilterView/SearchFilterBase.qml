import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

ColumnLayout{
    Layout.fillWidth: true
    Layout.fillHeight: true
    RowLayout{
        SwitchDelegate{
            text: qsTr("指定缺陷（时间查询有效）")
            checked: coreState.searchByDefectEnable
            onCheckedChanged: coreState.searchByDefectEnable=checked
        }
        Rectangle{
            height: 1
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
        }
        Button{
            text: "全选"
            enabled: coreState.searchByDefectEnable
            onClicked: {
                let newDefectCheckeds={}
                for (let i=0;i<coreModels.defectDictModel.count;i++){
                    let code = coreModels.defectDictModel.get(i).id
                    newDefectCheckeds[code]=true
                }
                coreState.searchDefectDict=newDefectCheckeds

            }
        }
        Button{
            text: "取消全部"
            enabled: coreState.searchByDefectEnable
            onClicked: {
                let newDefectCheckeds={}
                for (let i=0;i<coreModels.defectDictModel.count;i++){
                    let code = coreModels.defectDictModel.get(i).id
                    newDefectCheckeds[code]=false
                }
                coreState.searchDefectDict=newDefectCheckeds
            }
        }
        Item{
            height: 1
            width: 10
        }
    }
    SearchByDefect{
        visible: coreState.searchByDefectEnable
        id:shDf
        enabled: coreState.searchByDefectEnable
        // 通过缺陷查询数据
        Layout.fillWidth: true
        Layout.fillHeight: true
    }
}
