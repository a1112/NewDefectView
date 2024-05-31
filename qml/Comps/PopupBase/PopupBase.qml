import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../Base"

Popup  {
    id:root
    property alias title: title.text
    property Component body
    property Component footer
    ColumnLayout{
        anchors.fill: parent
        RowLayout{
            Layout.fillWidth:true
            height: 35
            Item{
                Layout.fillWidth:true
                height: 1
            }
            Label{
                id:title
                text: "数据导出"
                font.pixelSize: 25
                font.bold: true
                color:Material.color(Material.Blue)
            }

            Item{
                Layout.fillWidth:true
                height: 1
            }

            ImageButton{
                source: coreStyle.getIcon("NO")
                onClicked: root.close()
            }
        }
        //--------------------------------------------


        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Item{
                anchors.centerIn: parent
                width: parent.width-50
                height: parent.height-20

                Loader{
                    width: parent.width
                    height: parent.height
                    sourceComponent:body
                }
            }
        }
        Loader{
            Layout.fillWidth: true
            height: 40
            sourceComponent:footer
        }


    }


}
