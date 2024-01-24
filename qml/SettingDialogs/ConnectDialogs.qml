import QtQuick 2.15
import Qt.labs.platform 1.1
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "../btns"

Menu{
    id:root
    dim:true
    height: list.height//list.contentHeight>1000?1000:list.contentHeight
    width: list.width
    property string key_: ""
    property string loc_hostname: ""
    Material.elevation: 10
    function myPopup(){
        root.popup()
        root.y-=50
    }
    function myClose(){
        // 关闭
        root.close()
    }

    Flow{
        id:list
        width:800
        height:implicitHeight
        spacing: 0.1*dpi
        padding : 0.05*dpi
        Repeater{
            model:coreModels.hostListModels
            Button{
                property string errorMsg: ""
                property string serverUrl: modelData.protocol+modelData.hostname+":"+modelData.port
                property int serverDelayed: -1
                id:btn
                //                font.bold: true

                Material.background:coreModels.hostIndex===index?
                                        Material.Teal:Material.buttonDisabledColor
                Timer{
                    id:getServerDelayed
                    interval: 2000
                    triggeredOnStart: true
                    running: root.visible
                    onTriggered: {
                        let sT = new Date().valueOf()
                        api._getServerDelayed_(btn.serverUrl,(result)=>{
                                                   let eT = new Date().valueOf()
                                                   let delTime=eT-sT
                                                   btn.serverDelayed=delTime
                                                   if (root.visible)
                                                   getServerDelayed.restart()
                                               },
                                               (msg)=>{
                                                   btn.serverDelayed=-2
                                                   btn.errorMsg=msg
                                                   if (root.visible)
                                                   getServerDelayed.restart()
                                               })
                    }
                }
                text: serverUrl+" "+modelData.msg+
                      "<font color="+(
                          serverDelayed===-2?"'red'":
                                              serverDelayed===-1?"'yellow'":
                                                                  serverDelayed<100?"'green'":
                                                                                     serverDelayed<300?"'yellow'":"'red'")
                      +">"+(
                          serverDelayed===-2?"连接失败":
                                              serverDelayed===-1?"连接中！":"连接成功！"
                                                                  +"</font>")
                onClicked: {
                    coreModels.hostIndex=index
                    myClose()
                }
                MouseArea{
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    onClicked:  {
                        loc_hostname=modelData.hostname
                        delMenu.popup()
                    }
                }
            }
        }
        AddButton{
            onClicked: {
                addMenu.popup()
            }
        }
        Menu{
            id:delMenu
            MenuItem{
                text: qsTr("ping")
                onClicked: {
                    cppFuncs.os.system("cmd /k start ping "+loc_hostname)
                }
            }
            MenuItem{
                text: qsTr("远程该计算机")
                onClicked: {
                    cppFuncs.os.system("mstsc /admin /v "+loc_hostname)
                }
            }
            MenuItem{
                text: qsTr("打开共享文件夹")
                onClicked: {
                    cppFuncs.os.system("Explorer \\\\"+loc_hostname)
                }
            }
            MenuItem{
                text: qsTr("移除")
                onClicked: {
//                    coreModels.hostListModels.pop(index)
                }
            }
        }
        AddMenu{
            id:addMenu
            onAddServer: (ip,msg)=>{
                             let newModelList = coreModels.hostListModels
                             newModelList.push(        {
                                                   hostname:ip,
                                                   port:809,
                                                   protocol:"http://",
                                                   msg:msg
                                               })
                             coreModels.hostListModels=[]
                             coreModels.hostListModels=newModelList
                         }
        }
    }

}
