import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../../Comps"
import "../"
Item {
    property DefectShowMainItem dsmItem
    MouseArea{
        anchors.fill: parent
        onDoubleClicked: {
        sdm.openMaxImageDialogView(currenctmaxImageSource,currentImageObjects)
        }
    }
    MaxImageComp{
            anchors.fill: parent
        source:currenctmaxImageSource
        imageObjs:currentImageObjects
    }
}
