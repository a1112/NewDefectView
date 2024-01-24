import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../../btns"
import "../../../Labels"
Item{
id:root
height: autoSize.itemTabHeight
Pane{
    anchors.fill: parent
    Material.elevation: 5
}
MouseArea{
    anchors.fill: parent
    onDoubleClicked: steelLevelCore.maxListView=!steelLevelCore.maxListView
}

RowLayout{
    width: parent.width
    height: parent.height
    spacing: 0.1*dpi
    BaseLabel{
        text: steelLevelCore.currentDefectName
        Layout.alignment: Qt.AlignHCenter
    }
    Item{
        height: root.height
        width: height*1
    }
    Row{
        spacing: 5
        height: root.height


        Button{
            anchors.verticalCenter: parent.verticalCenter
            height: root.height
            text: "单图模式"
            onClicked: steelLevelCore.selectModelIndex=0
            Rectangle{
            width: parent.width
            height: 3
            anchors.bottom: parent.bottom
            visible:steelLevelCore.selectModelIndex==0
            color: Material.color(Material.accentColor)
            }
        }
        Button{
            visible: false
            anchors.verticalCenter: parent.verticalCenter
            height: root.height
            text: "原图模式"
            onClicked: steelLevelCore.selectModelIndex=2
            Rectangle{
            width: parent.width
            height: 3
            anchors.bottom: parent.bottom
            visible:steelLevelCore.selectModelIndex==2
            color: Material.color(Material.accentColor)
            }
        }

        Button{
            anchors.verticalCenter: parent.verticalCenter
            height: root.height
            text: "缺陷列表"
            onClicked: steelLevelCore.selectModelIndex=1
            Rectangle{
            width: parent.width
            height: 3
            anchors.bottom: parent.bottom
            visible:steelLevelCore.selectModelIndex==1
            color: Material.color(Material.accentColor)
            }
        }


        Item{
            visible: steelLevelCore.selectModelIndex
            height: 30
            width: 150
        SpinBox {
            id: spinbox
            width: parent.width
            height: parent.height
            from: 0
            value: steelLevelCore.cellWidthScale*100
            onValueChanged: {
            steelLevelCore.cellWidthScale=value/100
                if(steelLevelCore.cellWidthScale<0.5)
                    steelLevelCore.cellWidthScale=0.5
            }
            to: 100 * 10
            stepSize: 10
            anchors.centerIn: parent
            property int decimals: 2
            property real realValue: value / 100
            validator: DoubleValidator {
                bottom: Math.min(spinbox.from, spinbox.to)
                top:  Math.max(spinbox.from, spinbox.to)
            }
            textFromValue: function(value, locale) {
                return Number(value / 100).toLocaleString(locale, 'f', spinbox.decimals)
            }
            valueFromText: function(text, locale) {
                return Number.fromLocaleString(locale, text) * 100
            }
        }
        }

        BaseLabel{
            text:"筛选"
            anchors.verticalCenter: parent.verticalCenter
        }
        Repeater{
                model: [1,2,3]
            CheckBox{
                height: parent.height
                text: ""+modelData+" ("+(steelLevelCore.gradesDict[modelData] == undefined?0:steelLevelCore.gradesDict[modelData])+")"
                checked: true
                Material.accent: modelData>=3?Material.Red:modelData>=2?Material.Yellow:Material.Blue
                onCheckedChanged: {
                    steelLevelCore.checkDefectClasses[modelData]=checked
                    let old= steelLevelCore.checkDefectClasses
                    steelLevelCore.checkDefectClasses=[]
                    steelLevelCore.checkDefectClasses=old
                }
            }
        }
}




    Item{
        Layout.fillWidth: true
        Layout.fillHeight: true
    }
//    PreBtn{
//        onClicked: {
//            dsmItem.selectNextImage(1)
//        }
//    }
//    NextBtn{
//        onClicked: {
//         dsmItem.selectNextImage(-1)
//        }
//    }
    Item{
        height: root.height
        width: height
        WindowModelChangeButton{
        shouMaxIcon:!steelLevelCore.maxListView
        onClicked: steelLevelCore.maxListView=!steelLevelCore.maxListView
        }
    }
    Item{
    height: 10
    width: 10
    }
}

}
