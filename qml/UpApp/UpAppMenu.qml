import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Labels"


Popup {
    id:root
    anchors.centerIn: parent
    width: 400
    height: 300

    ColumnLayout{
        anchors.fill: parent
        LabelTitle{
            font.pixelSize: 25
            text: "软件更新： "+upAppCore.newVersion
            Layout.alignment: Qt.AlignHCenter
            color: Material.color(Material.Blue)
        }
        Rectangle{
            width: root.width-20
            Layout.alignment: Qt.AlignHCenter
            height: 1
            color: "green"
        }
        ListView{
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: upAppCore.upMsg
            delegate: Label{
                text: modelData
            }
        }
        RowLayout{
            Layout.fillWidth: true
            spacing: 15
            Item{
            Layout.fillWidth: true
            height: 4

            }
            Button{
                text: "取消"
                onClicked: root.close()
            }
            Button{
                text: "更新"
                Material.background: Material.Blue
                onClicked: {
                    console.log(api.getUpdateUrl())

                    console.log(cppFuncs.os.system(api.getUpdateUrl()))
                    Qt.quit()
                }
            }
        }
    }
}
