import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
ImageButton{
    source:coreStyle.getStyleIcon("Flush",coreStyle.theme)// coreStyle.getStyleIcon("Flush")
    Item{
        anchors.fill: parent
        Image{
            id:image
            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }


}
