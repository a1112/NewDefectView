import QtQuick 2.15
import QtQuick.Controls 2.15
SampBase{
    id:root
    property var model
    property int currentIndex: 0
    item:ComboBox{
        id: control
        model: root.model
        onCurrentIndexChanged: root.currentIndex = control.currentIndex
        }

}
