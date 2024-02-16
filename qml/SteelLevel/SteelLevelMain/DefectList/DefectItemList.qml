import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "../../../btns"
import "../../../Labels"
ListView {
    property color defectColor: color
    clip: true
    id:root
    currentIndex: steelLevelCore.selectTopIndex===topIndex&&itemView&& !steelLevelCore.isAllDefectModel?steelLevelCore.currentIndex:0
    property bool itemView: steelLevelCore.visDefectClass===index
    property var gradList: {return {}}
    function clear_(){
        gradList={}
        return root.model.clear()
    }
    function append_(item){
        if(item.grade in gradList){
            gradList[item.grade]+=1
        }
        else{
        gradList[item.grade]=1
        }
        root.model.append(item)
    }

    onItemViewChanged: {
    flushItemsView()
    }
    property alias oneDefectModels: root.model

    headerPositioning:ListView.OverlayHeader
    height:itemView?maxItemHeight:30
    visible: model.count>0
    model: ListModel{
        id:listModel
    }
    highlight:Item{
        clip: true
        Rectangle{
            height: parent.height
            radius: 1.5
            color: Material.color(Material.accent)
            width: 10
            Behavior on width {
                enabled: true
                NumberAnimation{
                    duration: 167
                    easing.type: Easing.OutCubic
                }
            }
        }
    }
    delegate: Item{
        height: 25
        function setHovDefect(){
            steelLevelCore.setAcTiveSelect(topIndex)
            steelLevelCore.setSelectDefect(oneDefectModels,index,topIndex)
        }
        ItemDelegate{
            anchors.fill: parent
        onHoveredChanged: {
            if (hovered){
                setHovDefect()
            }
        }
        }
        RowLayout{
            LabelBase{
                text: defectNo
                color: Material.color(Material.Green)
            }
            LabelBase{
                text: name
            }
            LabelBase{
                text: "x:"+defectX
            }
            LabelBase{
                text: "y:"+defectY
            }
            Item{
            Layout.fillWidth: true
            height: 1

            }
            LabelBase{
                text:  "Lv:"
            }
            LabelBase{
                text: grade
            }
        }
        width: root.width
    }

    header:Item{
        z:9999
        width: parent.width
        height: autoSize.itemTabHeight+10
        Item{
            width: parent.width-10
            height: parent.height-24
            Pane{
                Material.elevation: 5
                anchors.fill: parent
            }
            MouseArea{
                anchors.fill: parent
                onDoubleClicked: {
                    steelLevelCore.defectCanViewList[id]=true
                    if(steelLevelCore.visDefectClass==index)
                        steelLevelCore.visDefectClass=-1
                    else
                        steelLevelCore.visDefectClass=index
                    steelLevelCore.updata_defectCanViewList()
                }
            }
            Rectangle{
                id:rec
                anchors.fill: parent
                color: "#22FFFFFF"
                RowLayout{
                    spacing: 3
                    width: parent.width
                    anchors.verticalCenter: parent.verticalCenter
                    LabelBase{
                        text: id
                        color: defectColor
                        font.bold: true
                        font.pixelSize: autoSize.titleTextSize
                    }
                    Rectangle{
                        color: defectColor
                        height: 10
                        width: height
                    }
                    LabelBase{
                        text: name+" : "+root.model.count+""
                        font.bold: true
                        font.pixelSize: titleTextSize-2
                    }
                    Item{
                        Layout.fillWidth: true
                        height: 1
                    }
                    EyeButton{
                        id:eb
                        selected: steelLevelCore.defectCanViewList[id] === undefined ||steelLevelCore.defectCanViewList[id]
                        onSelectedChanged: {
                             取消显示
                            if(!selected &&steelLevelCore.visDefectClass==index){
                            steelLevelCore.visDefectClass=-1
                            }
                        }
                        onClicked: {
                            steelLevelCore.defectCanViewList[id]=!selected
                                steelLevelCore.updata_defectCanViewList()
                        }
                    }
                    RadioButton{
                        enabled: eb.selected
                        checked:steelLevelCore.visDefectClass==index
                        onCheckedChanged: {
                        if(checked)
                            steelLevelCore.visDefectClass=index
                        }
                    }
                }
            }

            LabelBase{
                visible: gradList[3]>0
                anchors.left: rec.right
                text: gradList[3]??0
                font.bold: true
                color:"red"
                font.pixelSize: 18
            }
        }
    }
}

