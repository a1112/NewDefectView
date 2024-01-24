import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
Flickable {
     contentHeight: image.height
     contentWidth: image.width
 Image {
     id: image
     source: image_source
     width: sourceSize.width
     height:sourceSize.height
 }
 Item{
     anchors.centerIn: image
     width: image.width*image.scale
     height: image.height*image.scale
 WheelHandler{
     targetTransformAroundCursor:false
     target: image
     property: "scale"
 }
 }
}
