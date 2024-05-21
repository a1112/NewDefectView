import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../Base"

Popup  {
    id:root
    property alias title: title.text
    property Component comp
    ColumnLayout{
        anchors.fill: parent
        RowLayout{
            Layout.fillWidth:true
            height: 45
            Item{
            Layout.fillWidth:true
            height: 1
            }
        Label{
            id:title
            text: "数据导出"
            font.pixelSize: 30
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

            Loader{

            sourceComponent:comp

            }


        }

    }


}
