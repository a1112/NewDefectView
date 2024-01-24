/*
    1, 放大，缩小的图像功能


*/

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../Comps"
Popup {
    id:root
    property string imageSource
    property var imageObjects
    function myPopup(currenctmaxImageSource, currentImageObjects){
        root.imageSource=currenctmaxImageSource
        imageObjects=currentImageObjects
        root.open()
    }
    x:(id_app.width-width)/2
    y:(id_app.height-height)/2
    width: id_app.width*0.95
    height: id_app.height*0.95
    Item{
        id:root_item
        anchors.fill: parent
        Flickable{
            clip: true
            anchors.fill: parent
            contentWidth: coreConfig.imageWidth*image.scale
            contentHeight: coreConfig.imageHeight*image.scale
            MaxImageComp{
                width: coreConfig.imageWidth
                height: coreConfig.imageHeight
                id:image
                source: imageSource
                imageObjs:imageObjects
                WheelHandler{
                    property: "scale"
                    targetTransformAroundCursor:false
                }

            }
            ScrollBar.vertical: ScrollBar{}
            ScrollBar.horizontal: ScrollBar{}
        }

    }
}
