import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Row {
    property int hours: parseInt(hours_comb.editText)
    property alias hoursIndex: hours_comb.currentIndex
    property int minutes: parseInt(minutes_comb.editText)// minutes_comb.currentIndex
    property alias minutesIndex: minutes_comb.currentIndex
    property int seconds:parseInt(seconds_comb.editText)// seconds_comb.currentIndex
    property alias secondsIndex: seconds_comb.currentIndex
    property int itenHeight: 30
    TextFieldTime{
        id:hours_comb
        model: 24
        placeholderText:"点"
        width: 100
        currentIndex: 0
    }
    TextFieldTime{
        id:minutes_comb
        width: 100
        model: 60
        placeholderText:"分"
        currentIndex: 0
    }
    TextFieldTime{
        visible: false
        width:100
        id:seconds_comb
        currentIndex: 0
        model: 60
    }
}
