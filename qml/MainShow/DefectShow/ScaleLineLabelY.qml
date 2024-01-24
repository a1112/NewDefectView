import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../Base"
Item {
    id:root
    width: col.width
    height: parent.height
    Column{
        id:col
        Repeater{
            id:rep
            model: 6
            delegate:Item{
                anchors.right: col.right
                width: lib.width
                height:root.height/rep.model
                LabelBase{
                    anchors.top: parent.top
                    id:lib
                    text: ((index-3)*0.7).toFixed(1)+"m"
                }
            }
        }
    }
}
