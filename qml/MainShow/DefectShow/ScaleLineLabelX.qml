import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../Base"
Item {
    id:root
width: parent.width
height: 20
Row{
Repeater{
    id:rep
    model: 10
    delegate:Row{
        width:root.width/rep.model
        LabelBase{
        text: index*5+"m"
        }
    }
}
}
}
