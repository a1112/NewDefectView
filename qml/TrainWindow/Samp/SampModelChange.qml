import QtQuick 2.15
import QtQuick.Controls 2.15
SampBase{
    id:root

    property int currentIndex: 0
    item:Row{
        spacing: 5
        ComboBox{
                id: control
                model: trainApi.trainListModels
                onCurrentIndexChanged: root.currentIndex = control.currentIndex
                }
        ComboBox{
                id: control2
                model: trainApi.frameList[control.currentIndex]
                onCurrentValueChanged: {
                    console.log("onCurrentValueChanged")
                    console.log(control2.currentValue)
                    trainApi.currentFrame = control2.currentValue

                }
                }


    }

}
