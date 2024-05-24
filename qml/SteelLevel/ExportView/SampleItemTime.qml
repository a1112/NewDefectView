import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../SearchView"
RowLayout{
    Layout.fillWidth: true
    property alias startTime: startTime_id.currentDate
    property alias endTime: endTime_id.currentDate
    ColumnLayout{
        Layout.fillWidth: true
        DataTimeSelectItem{
            id:startTime_id
            text: qsTr("起始时间")
            isFromTime:true
        }
        DataTimeSelectItem{
            id:endTime_id
            isFromTime:false
            text: qsTr("结束时间")
        }
    }
    Item {
        width: 5
    }
}
