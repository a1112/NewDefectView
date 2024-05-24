import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../../Comps/PopupBase"
PopupBase{
    id:root
    anchors.centerIn: parent
    width: 800
    height: 400
    title:"数据导出"
    property SampleItemTime timeItem
        property SampleItemFileOut fileOut_id

    body:ColumnLayout
        {
            width: root.width
            SampleItemMsg{
                running: root.visible
            }
            SampleItemFileOut{
                Component.onCompleted: {
                    fileOut_id=this
                }
            width: root.width
            }
            SampleItemName{
                id:fileName_id
            width: root.width
            }
            SampleItemTime{
                Component.onCompleted: {
                    timeItem=this
                }
            }
    }
    footer:Item{
    RowLayout{
        anchors.fill: parent
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Button{
            text: "导出"
            onClicked: {
                console.log(timeItem.startTime)
                console.log(timeItem.endTime)
                api.exportSteelLevelByTime(
                            timeItem.startTime,timeItem.endTime,fileOut_id.fileName,
                            (result)=>{
                                    let reData = JSON.parse(result)
                            },
                            (errorMsg)=>{  //判级判断获取失败
                                console.log(errorMsg)
                            }
                            )
            }
        }

    }
    }
}
