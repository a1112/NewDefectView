import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../Base"
import "../ImageSystem"
import "../HeadInfo"
import "../FootView"
import "../DebugView"
import "../DefectNavigationView"
import "../MainShow"
import "../ListShowView"
Rectangle {
    color:"#282832"
    Item{
        width: 0.2*dpi
        height: 1
    }
    RowLayout{
        anchors.fill: parent
        spacing: 0.23*dpi
        Item{
            height: row.height
            width: row.width
            ItemDelegate{
                anchors.fill: parent
                HoverHandler{
                    cursorShape: Qt.PointingHandCursor
                }
                onClicked: {
                    sdm.openConnectDialogs()
                }
            }
            RowLayout{
                id:row
                height: 0.2*dpi
                LabelBase{
                    Layout.alignment: Qt.AlignVCenter
                    text:api.apiConfig.msg+"  服务器地址：" + api.apiConfig.serverUrl
                    Material.foreground: Material.Green
                    font.bold: true
                }
                Item{
                    height: 0.2*dpi
                    width: height
                    Image {
                        height: 0.17*dpi
                        width: height
                        anchors.centerIn: parent
                        fillMode: Image.PreserveAspectFit
                        source: coreStyle.getStyleIcon("Edit")
                    }
                }
            }
        }

        LabelBase{
            text:"连接延时：" + api.apiConfig.serverDelayed+ "ms"
            Material.foreground: Material.Blue
        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
        SizeInfoView{   //显示 x,y,w,h
            target: id_app
        }
    }
}
