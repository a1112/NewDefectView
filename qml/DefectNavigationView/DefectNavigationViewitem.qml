import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Base"
Item {
    id:root
    width: parent.width
    height: 0.45*dpi
    property string title: "上表面"
    property ListModel steelDetectionModel: ListModel{  // 检测的数量
        dynamicRoles: true
    }
    property string steelNo: coreState.currentSteelNo
    property real steelLen: (detectSteelImageNum*coreConfig.imageHeight*coreConfig.ypes/1000).toFixed(1)
    property real modelLen: 20          //      <-
    property int maxShowimageNum: 20
    property int maxMaxShowimageNum: coreObj.maxShowimageNum
    property int detectSteelImageNum: steelDetectionModel.count
    onDetectSteelImageNumChanged: {
        if (detectSteelImageNum==0){
            maxShowimageNum=20
        }
        if (detectSteelImageNum>maxShowimageNum*0.9){
            maxShowimageNum=parseInt(1.3*maxShowimageNum)
        }
    }
    readonly property real maxShowSteelLength:(detectSteelImageNum/maxMaxShowimageNum)*view_root.width
    property real stepSize : 5
    property real teatLen: 26
    function getTestStatus(index){
        if (teatLen/stepSize>index)
            return {
                "check":true,
                "error":true
            }
        return{
            "check":false,
            "error":false
        }
    }
    RecBase{
        anchors.fill: parent
        border.width: parent.height*0.02
    }
    RowLayout{
        anchors.fill: parent
        spacing: 0
        RecBase{
            height: parent.height
            width: 1.5*dpi
            Item{
                anchors.centerIn: parent
                width: parent.width*0.8
                height: parent.height*0.8
                LabelBase{
                    //                    font.family: "微软雅黑"
                    font.pixelSize: dpi*0.15
                    color:Material.color(Material.Orange)
                    text: title
                }
                Rectangle{
                    color: Material.color(Material.Blue)
                    height: parent.height*0.45
                    width: height*3.5
                    anchors.right: parent.right
                    LabelBase{
                        text:steelLen+"m"
                        anchors.centerIn: parent
                    }
                }
                LabelBase{
                    text:steelNo
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: Material.color(Material.Green)
                    font.pixelSize: dpi*0.16
                }

            }
        }
        Item{
            id:view_root
            Layout.fillWidth: true
            Layout.fillHeight: true
            Row{
                spacing: 0
                Repeater{
                    model:steelDetectionModel
                    Rectangle{
                        color: defectCount>0?
                                   Material.color(Material.Red)
                                 :Material.color(Material.Green)
                        height: root.height
                        width: maxShowSteelLength/detectSteelImageNum
                        LabelBase{
                            text: index
                            anchors.bottom: parent.bottom
                        }

                    }
                }
            }
            Row{
                spacing: 0
                Repeater{
                    model: modelLen
                    delegate: Item{
                        height: root.height
                        width: view_root.width/modelLen
                        property var testStatus:getTestStatus(index)
                        //                        RecBase{
                        //                            anchors.centerIn: parent
                        //                        height: parent.height
                        //                        width: parent.width
                        //                        visible: testStatus.check
                        //                        color:testStatus.error?Material.color(Material.Red):Material.color(Material.Green)
                        //                        }
                        Rectangle{
                            color: "#66ffff00"
                            width: parent.width*0.02
                            anchors.right: parent.right
                            height: parent.height
                        }
                        LabelBase{
                            //                            color: "#ffffff"
                            text: ((coreConfig.ypes*1.024*(index+1))/(maxMaxShowimageNum/modelLen)).toFixed(2) +"m"
                            anchors.right: parent.right
                        }
                        //                        LabelBase{
                        //                            font.bold: true
                        //                            anchors.right: parent.right
                        //                            anchors.bottom: parent.bottom
                        //                            //                            color: "#ffffff"
                        //                            text: "[0]"
                        //                            visible: testStatus.check
                        //                        }
                    }
                }
            }
            Rectangle{
//                x:core.selectX*view_root.width
                x:coreState.imShowStartIndex/maxMaxShowimageNum*view_root.width
                id:selectRec
                height: parent.height
                width:coreState.imCanShowCount/maxMaxShowimageNum*view_root.width
//                width: core.selectW*view_root.width
                color: "#00000000"
                border.color: Material.color(Material.Blue)
                border.width: 0.03*dpi
            }

            MouseArea{
                anchors.fill: parent
                onPressed:(mouse)=>{
                              moveRec(mouse.x)
                          }
                onPositionChanged:(mouse)=>  {
                                      moveRec(mouse.x)
                                  }
            }
        }
    }
    function moveRec(toX){
        toX=toX<selectRec.width/2?0:toX>view_root.width-selectRec.width/2?view_root.width-selectRec.width:toX-selectRec.width/2
        coreState.imShowStartIndex=(toX/view_root.width)*maxMaxShowimageNum
    }
}
