
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
                model: coreModels.hostListModels

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

                   TextField{
                       width: dialog.width-20
                       id:id_ip
                       placeholderText:qsTr("ip地址")
                   }
                   TextField{
                       width: dialog.width-20
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
                                             port:809,
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
