import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "SearcFilterView"
ColumnLayout {
    id:root
    //    property alias only:steelOmly.checked
    function searchByDate(){
        root.search(fromDate,toDate)
    }
    property DataTimeSelectItem dataTimeSelectItem
    property alias fromDate: startTime_id.currentDate
    property alias toDate: endTime_id.currentDate
    signal search(date fromDate,date toDate)
    function getDateTime(date_f,time_f){
        return new Date(parseInt(date_f.fullYear),
                        parseInt(date_f.month)-1,parseInt(date_f.day),
                        time_f.hours,
                        time_f.minutes,
                        time_f.seconds
                        )
    }

    RowLayout{
        Layout.fillWidth: true
        ColumnLayout{
            Layout.fillWidth: true
            DataTimeSelectItem{
                id:startTime_id
                text: qsTr("起始时间")
                isFromTime:true
            }
            DataTimeSelectItem{
                isFromTime:false
                id:endTime_id
                text: qsTr("结束时间")
            }
        }
        Button{
            Layout.alignment: Qt.AlignVCenter
            text: "查询   "
            onClicked: {
                root.searchByDate()
            }
        }
        Item {
            width: 5
        }
    }
    RowLayout{
        Layout.fillWidth: true
        Item{
            Layout.fillWidth: true
            height: 1
        }
        Button{
            text: qsTr("查询今天")
            onClicked: {

            }
        }
        Button{
            text: qsTr("查询最近1小时")
            onClicked: {
                root.searchByDate()
            }
        }
        Item{
            Layout.fillWidth: true
            height: 1
        }
               CheckDelegate{
                   id:steelOmly
                   text: qsTr("至今")
               }

    }
//    ColumnLayout{
//        Layout.fillWidth: true
//        Layout.fillHeight: true
//        RowLayout{
//            SwitchDelegate{
//                text: qsTr("指定缺陷（限时间查询）")
//                checked: coreState.searchByDefectEnable
//                onCheckedChanged: coreState.searchByDefectEnable=checked
//            }
//            Rectangle{
//                height: 1
//                Layout.fillWidth: true
//                Layout.alignment: Qt.AlignVCenter
//            }
//            Button{
//                text: "全选"
//                enabled: coreState.searchByDefectEnable
//                onClicked: {
//                    let newDefectCheckeds={}
//                    for (let i=0;i<coreModels.defectDictModel.count;i++){
//                        let code = coreModels.defectDictModel.get(i).id
//                        newDefectCheckeds[code]=true
//                    }
//                    coreState.searchDefectDict=newDefectCheckeds

//                }
//            }
//            Button{
//                text: "取消全部"
//                enabled: coreState.searchByDefectEnable
//                onClicked: {
//                    let newDefectCheckeds={}
//                    for (let i=0;i<coreModels.defectDictModel.count;i++){
//                        let code = coreModels.defectDictModel.get(i).id
//                        newDefectCheckeds[code]=false
//                    }
//                    coreState.searchDefectDict=newDefectCheckeds
//                }
//            }
//            Item{
//                height: 1
//                width: 10
//            }
//        }
//        SearchByDefect{
//            visible: coreState.searchByDefectEnable
//            id:shDf
//            enabled: coreState.searchByDefectEnable
//            // 通过缺陷查询数据
//            Layout.fillWidth: true
//            Layout.fillHeight: true
//        }
//    }



   // PopDateSelect{
   //     id:popd
   //     onSelectDate:{
   //         dataTimeSelectItem.setDate(date)
   //         popd.close()
   //     }

   // }
    SearchFilterDefect{}
//    SearchFilterSteelType{}

}
