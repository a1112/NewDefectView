import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
RowLayout {
id:root
    Repeater{
    model: ListModel{
        ListElement{
            topIndex:0
        }
        ListElement{
            topIndex:1
        }
    }
        DefectCanvas{   // view
        Layout.fillHeight: true
        Layout.preferredWidth:root.width/2 //activeIndex == index?root.width/5*3:root.width/5*2
    }
}
}
