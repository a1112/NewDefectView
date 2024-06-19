import QtQuick 2.15
import QtQuick.Controls 2.15
Item {
    id:root
    width: 20
    height: 100

    Repeater {
        model: defctsModel

        Rectangle{
            Label {
                id: name
                text: boxY
            }

            width: root.width
            height:5
            color: control.getColorById(defectID)
            y:root.height/imageCount * boxY
        }

    }
}
