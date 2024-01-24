import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "../Base"
import "../btns"
RowLayout{
    spacing: 0.2*dpi
    Repeater{
        model: ListModel{
            ListElement{
                show_text:"缺陷分布模式"
            }
            ListElement{
                show_text:"宽度分布模式"
            }
            ListElement{
                show_text:"缺陷统计模式"
            }
        }
        delegate: Item{
            width: dpi*1.6
            height: lab.height*1
            Rectangle{
                height: parent.height
                width: 0.05*dpi
                anchors.right: parent.right
                color: Material.color(Material.Blue)
            }
            LabelBase{
                color:index===coreState.mainPageIndex? Material.accentColor:Material.primaryTextColor
                anchors.centerIn: parent
                id:lab
                text: show_text
            }
        }
    }
    Item{
        Layout.fillWidth: true
        height: 1
    }
    PreBtn{
        enabled: coreState.hasPreSteel
        onClicked: {
            control.changeToPreSteel()
        }
    }
    NextBtn{
        enabled: coreState.hasNextSteel
        onClicked: {
            control.changeToNextSteel()
        }
    }
//    CheckRec{
//    show_text:"上表面"
//    }
//    CheckRec{
//    show_text:"下表面"
//    }

}
