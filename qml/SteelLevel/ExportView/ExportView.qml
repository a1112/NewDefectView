import QtQuick 2.15
import "../../Comps/PopupBase"
PopupBase{
    id:root
    anchors.centerIn: parent
    width: height
    height: parent.height/2
    title:"数据导出"
    body:
        Column{
            width: root.width
            SampleItemFileOut{
            width: root.width
            }

    }
    footer:Item{}
}
