import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
Menu {
    id:menu
    width: 120
    height: Math.min(600,list.contentHeight)
    signal click(var _id)
//    Repeater{
//    model: Object.keys(coreModels.defectDict)
//    MenuItem{
//        text:"<font color=\""+coreModels.defectDict[modelData].color+"\">"+coreModels.defectDict[modelData].name+"</font>"  // id,name,color
//        font.bold: true
//    }
//    }

    ListView{
        id:list
         model: Object.keys(coreModels.defectDict)
        width:menu.width
        height:menu.height-50

        ScrollBar.vertical: ScrollBar{}
        delegate:  ItemDelegate{
            width: root.width
            height: 40
            spacing: 20
            onClicked: {
                menu.click(modelData)
            }
            RowLayout{
                anchors.fill: parent
                Item{
                    width: 40
                    height: 1

            Label{
                font.bold: true
                font.pointSize: 15
                text:"<font color=\""+coreModels.defectDict[modelData].color+"\">"+coreModels.defectDict[modelData].name+"</font>"
            }
            Item{
                Layout.fillWidth: true
                height: 1
            }
            }
        }
    }
}
}
