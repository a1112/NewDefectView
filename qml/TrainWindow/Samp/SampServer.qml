import QtQuick 2.15
import QtQuick.Controls 2.15
SampBase {
    title: "服务器地址："
    id:root

    item: Row{
        spacing: 3
        Label {
            text: trainApi.connectState>=0?"已连接":"未连接"
            color: trainApi.connectState>=0?"green":"red"
            font.pixelSize: 15
            anchors.verticalCenter: parent.verticalCenter
        }
        TextField {
            width: 240
            text: trainApi.serverAdd.serverUrl
            font.pixelSize: 20
            selectByMouse: true
        }
        Button {
            text: "修改"
            onClicked: {
                trainApi.serverAdd.serverUrl = trainApi.serverAdd.serverUrl
            }
        }

    }
}
