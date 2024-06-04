import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../../Base"
Item {
    Layout.fillWidth: true
    height: autoSize.itemTabHeight
    Pane{       // head
        anchors.fill: parent
        Material.elevation: 5
    }
    RowLayout{
        anchors.fill: parent
        Item{
            width: row.width
            height: 25
            Row{
                id:row
                height: parent.height
                visible: topIndex===0

                RadioDelegateBase{
                    text: "全局 "
                    height: parent.height
                    checked: steelLevelCore.canVasScale==steelLevelCore.minCanVasScale
                    onClicked: {
                        steelLevelCore.canVasScale=Qt.binding(()=>steelLevelCore.minCanVasScale)
                        //        steelLevelCore.currentCanVasLen= Qt.binding(()=>steelLevelCore.minCanVasLen)
                    }
                }


                RadioDelegateBase{
                    text: "等比缩放"
                    height: parent.height
                    checked: steelLevelCore.canVasScale==steelLevelCore.maxCanVasScale
                    onClicked: {
                        steelLevelCore.canVasScale=Qt.binding(()=>steelLevelCore.maxCanVasScale)
                        //   steelLevelCore.currentCanVasLen=Qt.binding(()=>steelLevelCore.maxCanVasLen)
                    }
                }

                Button{
                    text: "重新判级"
                    height: parent.height
                }

            }

        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Row{
            spacing: 15
            ButtonBase{
                Material.foreground: steelLevelCore.hasDefectView?Material.Blue:Material.Green
                height: 30
                text: steelLevelCore.hasDefectView?"隐藏":"显示"
                onClicked: {
                    if(steelLevelCore.hasDefectView)
                    steelLevelCore.disViewDefect()
                    else
                        steelLevelCore.viewAlldefect()
                }
            }

            Button{
                visible: defectListCore.itemViewHasVis
                Material.foreground: Material.Blue
                height: 30
                text: "缺陷缩略->"
                onClicked: {
                    defectListCore.shrinkDefectList()
                }
            }
        }
    }
}
