
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
import "../../Labels"
import "../../btns"
ApplicationWindow{
    id:root
    visible: false
    width: 1000
    height: 500
    title: "切换服务器连接"
    property var ipList: []
    property var serverIpList: {

    }
    property bool hasServerIpList: false

    Component.onCompleted: {
        let ipList_=[]
        console.log("coreModels.hostListModels")
        console.log(coreModels.hostListModels)
        coreModels.hostListModels.forEach((value,index)=>{
                    value["net"]=false
                    console.log(JSON.stringify(value))
                    ipList_.push(value)
                                          }
                    )
        ipList=ipList_
        // ipList=coreModels.hostListModels
        coreModels.allHostListModels=ipList
    }

    function setServerIpList(ipList_){
        console.log("setServerIpList")
        serverIpList=ipList_
        hasServerIpList=true
        let _ipList_=[]

        coreModels.hostListModels.forEach((value,index)=>{
                    _ipList_.push(value)
                                          }
                    )
        ipList_.forEach((value,index)=>{

                    _ipList_.push(value)
                                          }
                    )
    ipList=_ipList_
    coreModels.allHostListModels=ipList

    }

    flags: Qt.Dialog
    function open(){
        visible=true
    }
    onActiveChanged:{
        console.log("onActiveChanged "+active)
        if(!active){
        root.visible=false
        }
    }
    property string key_: ""
    property string loc_hostname: ""
    Material.elevation: 10
    function myClose(){
        // 关闭
        root.visible=false
    }


    ColumnLayout{
        anchors.fill: parent
        Label{
            text: "连接设置"
            font.pointSize: 30
            Layout.alignment: Qt.AlignHCenter
            color: "blue"
        }


        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
            ListView{
                anchors.fill: parent
                clip: true
                currentIndex: coreModels.hostIndex
                model:ipList// ipList//coreModels.hostListModels

                highlight:Rectangle{
                        border.color: "red"
                        border.width: 1
                        color: "#00000000"
                        z:999
                }
                delegate:
                    ListItem{
                    width: root.width
                }
                footer: RowLayout{
                    width: root.width
                    Item{
                    Layout.fillWidth: true
                    height: 1
                    }
                    AddButton{
                    onClicked: {
                        dialog.open()
                    }
                    }

                }
            }
        }
    }
    Popup {
           id: dialog
           modal: true // 这里设置为true表示模态对话框
           width: 300
           height: row.height+20
           anchors.centerIn: parent
           Column{
               id:row
                   TextFieldBase{

                       id:id_ip
                       placeholderText:qsTr("ip地址")
                   }
                    TextFieldBase{

                       id:port_msg
                       text: "809"
                       placeholderText:qsTr("端口")
                   }
                   TextFieldBase{

                       id:id_msg
                       placeholderText:qsTr("描述信息")
                   }

               Button{
                   text: qsTr("确认")
                   anchors.horizontalCenter: parent.horizontalCenter
                   onClicked: {
                       let newModelList = coreModels.hostListModels
                       newModelList.push({
                                             hostname:id_ip.text,
                                             port:parseInt(port_msg.text),
                                             protocol:"http://",
                                             msg:id_msg.text
                                         })
                       coreModels.hostListModels=[]
                       coreModels.hostListModels=newModelList
                       dialog.close()
                   }
               }
           }


    }

}
