import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
RowLayout{
    Layout.fillWidth: true
    spacing: 30
    property alias text:  title_id.text
    property bool isFromTime: false
    id:root
    property date currentDate: new Date(tfIn.fullYearIndex+2020,tfIn.monthIndex,tfIn.dayIndex+1,
                                        to_ts.hoursIndex,to_ts.minutesIndex,to_ts.secondsIndex
                                        )

    PopDateSelect{
        id:popd
        onSelectDate:{
            setDate(date)
            popd.close()
        }

    }

    function setDate(date){
        let yearIndex=date.getFullYear()-2020
        let monIndex=date.getMonth()
        let dayIndex=date.getDate()-1
        let hoursIndex=date.getHours()-1
        let minuiIndex=date.getMinutes()-1
        tfIn.fullYearIndex=yearIndex
        tfIn.monthIndex=monIndex
        tfIn.dayIndex = dayIndex
        if (!isFromTime){
            to_ts.hoursIndex=hoursIndex
            to_ts.minutesIndex = minuiIndex
        }
    }

    LabelFootInfoKey{
        id:title_id
        text: "起始"
    }
            TimeInF{
                id:tfIn
            }
            InTimeComb{
                id:to_ts
            }
            MoreButton{
                height: 30
                width: 30
                Layout.alignment: Qt.AlignVCenter
                onClicked:{
                    popd.popDate(currentDate)
                }
            }

        Component.onCompleted: {
            let date=new Date()
            setDate(date)
        }
}
