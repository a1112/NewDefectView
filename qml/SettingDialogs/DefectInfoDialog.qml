import QtQuick 2.0
import Qt.labs.platform 1.1
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Menu{
    id:root
    //        anchors.centerIn: parent
    height: Math.min(1500,list.contentHeight)//list.contentHeight>1000?1000:list.contentHeight
    width: list.width
    property string key_: ""
    ColorDialog{
        id:colorDialog
        onAccepted: {
            coreModels.defectDict[key_].color=""+color
            list.model=[]
            list.model=Object.keys(coreModels.defectDict)
        }
    }
    function myPopup(){
        list.model=Object.keys(coreModels.defectDict)
        root.popup()
    }

    ListView{
        id:list
        width:600
        height:root.height-50
        delegate:  ItemDelegate{
            width: root.width
            height: 40
            spacing: 20
            onClicked: {
                key_=modelData
                colorDialog.open()}
            RowLayout{
                anchors.fill: parent
                Item{
                    width: 40
                    height: 1
                }
            Rectangle{
                height: parent.height*0.7
                width: height
                color:control.getColorById(modelData)
            }
            Label{
                        text: "缺陷名称: "+coreModels.defectDict[modelData].name+" 缺陷编号: "+
                        coreModels.defectDict[modelData].id
            }
            Item{
                Layout.fillWidth: true
                height: 1
            }
            }
        }
    }
}
