import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
Row {
    property alias fullYear:nTF.text
    property alias fullYearIndex: nTF.currentIndex
    property alias month: mTF.text
    property alias monthIndex: mTF.currentIndex
    property alias day: dTF.text
    property alias dayIndex: dTF.currentIndex
    property date date
    property alias title: title_id.text

    spacing: 5
    LabelBase{
        id:title_id
        anchors.verticalCenter: parent.verticalCenter
    }
    TextFieldTime{
        id:nTF
        placeholderText:"年"
        currentIndex:0
        width: 1*dpi
        model:{
        let list=[]
            for (let i=0;i<10;i++)
            {list.push(2020+i)
            }
            return list
        }
    }
    TextFieldTime{
        id:mTF
        placeholderText:"月"
        currentIndex:0
        width: 0.9*dpi
        model:{
        let list=[]
            for (let i=0;i<12;i++)
            {list.push(1+i)
            }
            return list
        }
    }

    TextFieldTime{
        id:dTF
        placeholderText:"日"
        currentIndex:0
        width:  0.9*dpi
        model:{
            let list=[]
            let days =  new Date(2020+fullYearIndex,monthIndex+1,0).getDate()
            for (let i =0;i<31;i++){
                list.push(i+1)
            }
        return list
        }
    }
}
