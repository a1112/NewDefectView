import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import "../../Comps/PopupBase"
PopupBase{
    id:root
    anchors.centerIn: parent
    width: 800
    height: 300
    title:"数据导出"
    body:ColumnLayout
        {
            width: root.width
            SampleItemFileOut{
            width: root.width
            }
            SampleItemTime{
            }

    }
    footer:Item{
    RowLayout{
        anchors.fill: parent
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Button{
            text: "导出"
            onClicked: {


            }
        }

    }
    }
}
