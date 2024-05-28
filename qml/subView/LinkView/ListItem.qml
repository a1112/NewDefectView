import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../btns"

Rectangle{
    height: autoSize.itemTabHeight*1.5
     property string errorMsg: ""
     property string serverUrl: modelData.protocol+modelData.hostname+":"+modelData.port
     property int serverDelayed: -1
     id:root
     //                font.bold: true
     color: Material.theme==Material.Dark?"#1f1f1f":"#CCCCCC"
     Material.background:coreModels.hostIndex===index?
                             Material.Teal:Material.buttonDisabledColor
     Timer{
         id:getServerDelayed
         interval: 2000
         triggeredOnStart: false
         running: root.visible
         onTriggered: {
             let sT = new Date().valueOf()
             api._getServerDelayed_(root.serverUrl,(result)=>{
                                        let eT = new Date().valueOf()
                                        let delTime=eT-sT
                                        root.serverDelayed=delTime
                                        if (!hasServerIpList){
                                            api._getServerList_(
                                                root.serverUrl,(result)=>{
                                                    let data = JSON.parse(result)
                                                    setServerIpList(data)
                                                },
                                                (msg)=>{
                                                }
                                                )
                                        }

                                        if (root.visible)
                                        getServerDelayed.restart()
                                    },
                                    (msg)=>{
                                        root.serverDelayed=-2
                                        root.errorMsg=msg
                                        if (root.visible)
                                        getServerDelayed.restart()
                                    })
         }
     }

    ItemDelegate{
       anchors.fill: parent
    }
    RowLayout{
            anchors.fill: parent
            spacing: 0
            ItemItemBase{
                width: 60
                LabelTitle{
                    text:modelData.protocol
                }
            }
            ItemItemBase{
                Layout.fillWidth: true
                LabelTitle{
                    text:modelData.hostname
                }
                LabelTitle{
                    text: "来自服务器"+net
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    color: "yellow"
                    visible: net
                }

            }
            ItemItemBase{
                width: 50
                LabelTitle{
                    text:modelData.port
                }
            }

            ItemItemBase{
                width: 200
                LabelTitle{
                    text:modelData.msg
                }
            }
            ItemItemBase{
                width: 80
                LabelTitle{
                    text:"<font color="+(
                                        serverDelayed===-2?"'red'":
                                                            serverDelayed===-1?"'yellow'":
                                                                                serverDelayed<100?"'green'":
                                                                                                   serverDelayed<300?"'yellow'":"'red'")
                                    +">"+(
                                        serverDelayed===-2?"连接失败":
                                                            serverDelayed===-1?"连接中！":"连接成功！"
                                                                                +"</font>")
                }
            }
            ItemItemBase{
                width: height*3
                height: parent.height
                Row{
                    id:row
                    spacing: 0
                    height: parent.height
                    Item{
                        height: parent.height
                        width: height
                    TextButton{
                        iconText: "P"
                        tipText:"ping"
                        width: parent.width
                        height: parent.height
                        onClicked: {
                            cppFuncs.os.system("cmd /k start ping "+loc_hostname)
                        }
                    }
                    }
                    Item{
                        height: parent.height
                        width: height
                    RemoteControlButton{
                            anchors.centerIn: parent
                            width: parent.width*0.6
                            height: width
                            onClicked: {
                                cppFuncs.os.system("mstsc /admin /v "+loc_hostname)
                            }

                    }
                    }
                    Item{
                        height: parent.height
                        width: height
                    ExplorerButton{
                        anchors.centerIn: parent
                        width: parent.width*0.6
                        height: width
                        onClicked: {
                            cppFuncs.os.system("Explorer \\\\"+loc_hostname)
                        }
                    }
                    }
                }

            }
            ItemItemBase{
                width: lbt.width+10
                Button{
                    anchors.centerIn: parent
                    height: parent.height-10
                    Material.foreground: Material.Green
                    id:lbt
                    text: qsTr("连接")
                    onClicked: {
                        coreModels.hostIndex=index
                    }
                }
            }
            ItemItemBase{
                width: lbt.width+10
                Button{
                    anchors.centerIn: parent
                    height: parent.height-10
                    id:lbr
                    enabled: !net
                    text: qsTr("移除")
                    onClicked: {
                        let newModels =coreModels.hostListModels
                        newModels.pop(index)
                        coreModels.hostListModels=newModels
                    }
                }
            }
    }

 }
