import QtQuick 2.15
import Qt.labs.platform 1.1
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
Item{
    id:root
    Layout.fillWidth: true
    height:rl.height/rl.scale
    property alias placeholderText: tf.placeholderText
    property alias placeholderTextColor: tf.placeholderTextColor
    property alias showText: lb.text
    signal search(string key)
    property alias inputMethodHints: tf.inputMethodHints
    property alias maximumLength: tf.maximumLength
    property alias validator: tf.validator
    RowLayout{
        anchors.horizontalCenter: parent.horizontalCenter
        id:rl
        scale: 1.5
        spacing: 0.1*dpi
        width: parent.width/scale

        Label{
            id:lb
            text: ""
        }
        TextField{
            //        inputMethodComposing:false
            font.bold: true
            focus: true
            selectByMouse: true
            id:tf
            //        scale: 1.5
            Keys.onPressed: (key)=>{
                                if ( Math.abs(Qt.Key_Enter-key.key)<2){
                                    root.search(tf.text)
                                }
                            }
            Layout.fillWidth: true

            MouseArea{
                anchors.fill: parent
                acceptedButtons: Qt.RightButton
                onClicked: {
                    tf.focus=true
                    contentMenu.popup()
                }
            }
            Menu { // 右键菜单
                title: "menu"
                id: contentMenu
                MenuItem {
                    text: "剪切"
                    onTriggered: {
                        tf.selectAll()
                        tf.cut()
                    }
                }
                MenuItem {
                    text: "复制  C"
                    onTriggered:{
                        tf.selectAll()
                        tf.copy()
                    }
                }

                MenuItem {
                    text: "粘贴  V"

                    onTriggered: {
                        tf.selectAll()
                        tf.paste()
                    }
                }
                MenuItem {
                    text: "全选  A"
                    onTriggered: tf.selectAll()
                }
                MenuItem {
                    text: "取消操作 Z"
                    onTriggered:tf.undo()
                }
                MenuSeparator { }

                Menu {
                    title: "历史记录..."

                    MenuItem {
                        text: "Do Nothing"
                    }
                }
            }
        }
        Button{
            text: "查询"
            onClicked: {
                root.search(tf.text)
            }
        }

    }
}
