import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
 Menu{
    id:root
     width: calend.width
     height: calend.height+20
    function popDate(date){
        calend.currentDate=date
        root.popup()
    }
     function toDate(date){
        calend.currentDate=date
     }

     signal selectDate(date date)
    CalendarView{
        id:calend
        anchors.centerIn: parent
        onSelectDate: {
            root.close()
            root.selectDate(date)
        }

    }
}
