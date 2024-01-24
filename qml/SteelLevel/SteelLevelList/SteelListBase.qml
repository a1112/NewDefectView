import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../Base"
import "SimpleList"
//定制化
ColumnLayout{
    id:root
    width: parent.width
    spacing: 0
    property alias currentIndex: list.currentIndex
    property int idWidth: root.width*0.12
    property int steelWidth_: root.width*0.18
    property int timeWidth: root.width*0.27
    property int  steelTypeWidth: root.width*0.18
    property int  levelWidth: root.width*0.05
    property real steelLength_: root.width*0.2
    Rectangle{
        id:lh
        z:1
        Layout.fillWidth: true
        height: autoSize.itemListHeight
        gradient: Gradient {
            GradientStop { position: 0.0;
                color: coreStyle.leftInfoStyle.historyListHeadGradientColor1//"#085FB2"
            }
            GradientStop { position: 1.0;
                color:  coreStyle.leftInfoStyle.historyListHeadGradientColor2//"#00498C"
            }
        }
        SplitViewBase{
            anchors.fill: parent
            spacing: 0
            HistoryHeadItem{
                onWidthChanged: idWidth=width
                SplitView.preferredWidth:idWidth
                text: "流水号"
            }
            HistoryHeadItem{
                SplitView.preferredWidth:steelWidth_
                text: "板号"
                onWidthChanged:{
                    steelWidth_=width
                }
            }
            HistoryHeadItem{
                SplitView.fillWidth: false
                SplitView.preferredWidth:steelTypeWidth
                text: "钢种"
                onWidthChanged:steelTypeWidth=width
            }
            HistoryHeadItem{
                SplitView.fillWidth: false
                SplitView.preferredWidth:steelLength_
                text: "规格"
                onWidthChanged:{
                    steelLength_=width
                }
            }
            HistoryHeadItem{
                SplitView.fillWidth: false
                SplitView.preferredWidth:levelWidth
                text: "等级"
                onWidthChanged:{
                    levelWidth=width
                }
            }
            HistoryHeadItem{
                SplitView.fillWidth: false
                text: "日期"
                SplitView.preferredWidth:timeWidth
                onWidthChanged: timeWidth=width
            }
        }
        MouseArea{
            anchors.fill: parent
            acceptedButtons: Qt.RightButton
            onClicked: {
            //    mn.popup()
            }
        }

    }

    Item{
        Layout.fillWidth: true
        Layout.fillHeight: true
    ListView {
        anchors.fill: parent
        currentIndex: coreState.currentSteelIndex
        onCurrentIndexChanged: {
            if(coreState.currentSteelIndex==coreModels.mainListModel.count-1){
                list.positionViewAtEnd()
            }
        }

        Behavior on height {NumberAnimation{duration: 500}}
        verticalLayoutDirection:ListView.BottomToTop
        clip: true
        id:list
        model:coreModels.mainListModel
        highlightMoveDuration:500
        ScrollBar.vertical: ScrollBar{}
        highlight : Item{
            z:99999
            Rectangle{
                anchors.fill: parent
                color: "#00000000"
                border.width: 1
                border.color: "red"
            }
        }
        delegate: ListItemDelegate{
            onClicked: {
                coreState.currentSteelIndex=index
                coreState.flushAuto()
            }
        }
    }
    }
}
