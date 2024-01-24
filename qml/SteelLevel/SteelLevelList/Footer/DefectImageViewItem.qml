import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../../Base"
import "../../../Labels"
Item{
    id:root
    property real imageScale:1.0
    onImageScaleChanged: {
        console.log()

    }

    Layout.fillWidth: true
    Layout.fillHeight: true

    Rectangle{
        id:bg_rec
        anchors.fill: parent
        color: "#000"

    }
    ScrollView{
        width: parent.width
        height: parent.height
        contentWidth:imageScale*it.width
        contentHeight: imageScale*it.height
        clip: true
        Item{
            id:it
            width:root.width*imageScale
            height: root.height*imageScale
        Image {
            id: defectImage
            source: api.getImage( steelLevelCore.selectDefect.cameraId,steelLevelCore.selectDefect.defectNo)
            onSourceChanged: imageScale=1.0
            fillMode: Image.PreserveAspectFit
            width: parent.width
            height: parent.height

        }
        transform:Scale{
            origin.x : 0
            origin.y : 0
            xScale : imageScale
            yScale : imageScale
        }
        WheelHandler{
            acceptedModifiers: Qt.ControlModifier
            onWheel: (event)=> {
                                    if(event.angleDelta.y>0){
                                       imageScale*=1.1
                                    }
                                    else{
                                       imageScale/=1.1
                                    }
                                    if (imageScale<1)
                                        imageScale=1
                                }

        }
        }

    }


//    MouseArea{
//        anchors.fill: parent
//        acceptedButtons: Qt.RightButton

//    }

}
