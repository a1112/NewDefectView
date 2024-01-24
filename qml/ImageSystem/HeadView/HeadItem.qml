import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../btns"
import "../../ToolTips"
import "../../Labels"
Item{
    property bool viewOnly:!isTop?
                               imageViewCore.bottomCanVisible&&!imageViewCore.topCanVisible?true:false
    :imageViewCore.bottomCanVisible&&!imageViewCore.topCanVisible?false:true
    id:root
    height: dpi*0.3
    Pane{
        anchors.fill: parent
        Material.elevation: 5
    }
    MouseArea{
        anchors.fill: parent
        onDoubleClicked: {
            if(isTop){
                imageViewCore.layoutType=
                        imageViewCore.isTopOnly?
                            imageViewCore.layoutOld:imageViewCore.layoutTop
            }
            else{
                imageViewCore.layoutType=imageViewCore.isBottomOnly?
                            imageViewCore.layoutOld:imageViewCore.layoutBottom
            }
        }
    }

    RowLayout{
        width: parent.width
        height: parent.height
        spacing: 0.1*dpi
        RowLayout{
            visible: viewOnly
            Layout.fillWidth: true
            Layout.fillHeight: true
            Item{
                height: root.height
                width: height
                AiBtn{
                }
            }


            RowLayout{
                AboutKeyLabel{
                    text: "布局："
                }
                Item{
                    height: root.height
                    width: height
                    ImageToolItemLayout{  //  横向自适应
                        layoutKey:imageViewCore.layoutHorizontal
                        anchors.fill: parent
                        source: coreStyle.getIcon("zoomV")
                        border_color:Material.color(Material.Red)
                        toolText:"横向布局"
                    }
                }
                Item{
                    height: root.height
                    width: height
                    rotation: 90
                    ImageToolItemLayout{  //  纵向自适应
                        layoutKey:imageViewCore.layoutVertical
                        anchors.fill: parent
                        source: coreStyle.getIcon("zoomV")
                        border_color:Material.color(Material.Yellow)
                        toolText:"纵向布局"
                    }
                }
                Item{
                    height: root.height
                    width: height
                    ImageToolItemLayout{  //  top only
                        layoutKey:imageViewCore.layoutTop
                        anchors.fill: parent
                        source: coreStyle.getIcon("top")
                        border_color:Material.color(Material.Blue)
                        toolText:"只看上表"
                    }
                }
                Item{
                    height: root.height
                    width: height
                    rotation: 180
                    ImageToolItemLayout{  //  button only
                        layoutKey:imageViewCore.layoutBottom
                        anchors.fill: parent
                        source: coreStyle.getIcon("top")
                        border_color:Material.color(Material.Green)
                        toolText:"只看下表"
                    }
                }

            }
            Item{
                height: root.height
                width: row2.width
            RowLayout{
                id:row2
                height: root.height
                Item{
                    width: che.width
                    height: root.height
                    CheckDelegate{
                        height: parent.height*0.8
                        anchors.verticalCenter: parent.verticalCenter
                        id:che
                        text: "显示缺陷"
                        checked: imageViewCore.imageSystemCanViewDefect
                        onCheckedChanged: imageViewCore.imageSystemCanViewDefect=checked
                    }
                }
                Row{
                    AboutKeyLabel{
                        text: "滚动速度"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    Item{
                        width: spi.width
                        height: root.height
                    SpinBox {
                        height: parent.height
                        id:spi
                        editable: true
                        focus: true
                        from: imageViewCore.minImageViewSpeed
                        value: imageViewCore.imageViewSpeed
                        onValueChanged: imageViewCore.imageViewSpeed=value
                        to: imageViewCore.maxImageViewSpeed
                        stepSize: imageViewCore.imageViewSpeedStepSize
                        Component.onCompleted: {
                            spi.forceActiveFocus()
                        }
                    }
                    }
                }

                Item{
                    visible: true
                    width: che2.width
                    height: root.height
                    ComboBox{
                        height: parent.height*0.9
                        anchors.verticalCenter: parent.verticalCenter
                        id:che2
                        currentIndex: coreState.currentImageMoveModel
                        onCurrentIndexChanged:  coreState.currentImageMoveModel=currentIndex
                        model: ["滚动","跳转"]
                    }
                }
            }
        }
            }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        Row{
            Repeater{
                model:isTop?coreState.upImageWidthInfoList:coreState.downImageWidthInfoList
                LabelFootInfoValue{
                    toolText:"相机："+(index+cameraStartIndex)+" 图像数量"
                    text:" > "+imageCount+" "
                    Material.foreground: Material.Blue
                }
            }


        }
        ProgressBar{
        visible: false
        }
        RowLayout{
            visible: viewOnly
            Layout.fillWidth: true
            Layout.fillHeight: true
            Item{
                height: root.height
                width: height
                ImageToolItem{  //  button only
                    anchors.fill: parent
                    source: coreStyle.getIcon("link")
                    border_color:Material.color(Material.Blue)
                    checked: imageViewCore.linkX
                    onClicked: {
                        imageViewCore.linkX=!imageViewCore.linkX
                    }
                }
            }
        }
    }

}
