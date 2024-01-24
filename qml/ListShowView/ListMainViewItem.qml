import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.3

import QtQuick.Layouts 1.15
import "../Base"

Item {
    id:root
    Rectangle{
        anchors.right: parent.right
        width: parent.width-0.1*dpi
        height: parent.height
        border.color: root.ListView.isCurrentItem?"#2196F3":"#FFF"
        border.width: 3
        color: errorLevel>2?Material.color(Material.Red):
                             errorLevel>1
                             ||upDefectNum||downDefectNum
                             ?Material.color(Material.Yellow):Material.color(Material.Green)

        ItemDelegate{
            anchors.fill: parent
            onClicked: {
                coreState.currentSteelIndex=index
                coreState.flushAuto()
            }
        }
        Item{
            anchors.centerIn: parent
            width: parent.width-0.1*dpi
            height: parent.height-0.1*dpi
            RowLayout{
                spacing: 0.05*dpi
                anchors.fill: parent
                CheckRec{
                    recWidth:0.24*dpi
                    Layout.alignment: Qt.AlignTop
                }
                Column{
                    spacing: 0
                    height: parent.height*0.9
                    Layout.alignment: Qt.AlignVCenter
                    Layout.fillWidth: true
                    ListMainViewInfoItem{
                        color: "#5A5B55"
                        tList: ["卷号","长度","序号"]
                        vList: [steelNo,steelLength+"米", steelID]
                    }
                    ListMainViewInfoItem{
                        color: "#646464"
                        tList: ["钢种","宽度","上表缺陷"]
                        vList: [steelType,steelWidth+"米", upDefectNum]
                    }
                    ListMainViewInfoItem{
                        color: "#5A5B55"
                        tList: ["时间","厚度","下表缺陷"]
                        vList: [detectTime,steelThick+"mm", downDefectNum]
                    }
                }
            }
        }

    }
}
