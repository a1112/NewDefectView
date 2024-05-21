import QtQuick 2.15
import "../../Comps/PopupBase"
PopupBase{
    id:root
    anchors.centerIn: parent
    width: height
    height: parent.height/2
    title:"数据导出"
    comp:

        Column{
            width: root.width

            SampleItem{
            width: root.width
            }

    }
}
