import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Base"
import "../Inputs"
Menu{
    id:root
    width: row.width
    height: row.height
    signal addServer(string ip,string msg)
    Row{
        id:row
        Column{
            TextFieldBase{
                id:id_ip
                placeholderText:qsTr("ip地址")
            }
            TextFieldBase{
                id:id_msg
                placeholderText:qsTr("描述信息")
            }
        }
        Button{
            anchors.verticalCenter: parent.verticalCenter
            text: qsTr("确认")
            onClicked: {
                addServer(id_ip.text,id_msg.text)
                root.close()
            }
        }
    }
}
