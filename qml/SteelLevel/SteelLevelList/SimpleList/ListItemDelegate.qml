import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
Item{
    id:rt
    property int grade_: grade??1

    visible: steelLevelCore.selectSteelModel[grade_]
    property string timeStr: ""
    property color t_color :grade>2?"red":grade>1?"yeellow":Material.foreground
    width: root.width
    height: autoSize.itemListHeight
    Rectangle{
        width: parent.width
        height: parent.height
        color: Material.theme==Material.Dark?"#1f1f1f":"#CCCCCC"
    }
    signal clicked(int index)
    ItemDelegate{
        anchors.fill: parent
        ToolTip.visible: hovered
        ToolTip.text: "板号"+steelID+" 钢种："+steelType+" 长："+steelLength+"m 宽："+steelWidth+"m 厚："+steelThick+"mm"
        onClicked:{
            rt.clicked(index)
        }
    }
    Row{

        id:rowItem
        spacing:5
        anchors.fill: parent
        HistoryTextItem{
            width: idWidth
            text:steelID
            textColor:t_color
        }
        HistoryTextItem{
            text:steelNo
            textColor:t_color
            width: steelWidth_
        }

        HistoryTextItem{
            text:steelType
            textColor:t_color
            width: steelTypeWidth

        }
        HistoryTextItem{
            text:steelThick+"<font color=\"red\">*</font>"+steelWidth
            textColor:t_color
            width: steelLength_
        }
        HistoryTextItem{
            text:grade??1
            textColor:grade>2?"red":grade>1?"yeellow":"green"
            width: levelWidth

        }
        HistoryTextItem{
            width: timeWidth
            text:detectTime
            textColor:t_color
        }
    }
}
