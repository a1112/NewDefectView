import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../btns"
import "../ToolTips"
import "../Labels"
Column {
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    width: 0.5*dpi


    Item{
        width: 0.3*dpi
        height: width
        ImageToolItemBase{
            anchors.fill: parent
            source: coreStyle.getIcon("MourceArray")
            border_color:Material.color(Material.Red)
            toolText:"查看模式"
            checked:imageViewCore.imageShowModel==imageViewCore.imageViewModel
            onClicked: {
                imageViewCore.imageShowModel=imageViewCore.imageViewModel
            }
        }
    }
    Item{
        width: 0.3*dpi
        height: width
        ImageToolItemBase{
            anchors.fill: parent
            source: coreStyle.getIcon("ImageCat")
            border_color:Material.color(Material.Red)
            toolText:"标注模式"
             checked:imageViewCore.imageShowModel==imageViewCore.imageCrateDefectModel
             onClicked: {
imageViewCore.imageShowModel=imageViewCore.imageCrateDefectModel
             }
        }
    }
}
