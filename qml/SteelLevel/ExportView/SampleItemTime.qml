import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../SearchView"
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
    Item {
        width: 5
    }
}
