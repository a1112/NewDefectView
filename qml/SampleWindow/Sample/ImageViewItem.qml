import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../Labels"
import "../../Base"
Item {

    id:root
    width: cellWidth
    height: cellWidth
    property bool slected: false
    property string urlsT: ""
    onSlectedChanged: {
        if(slected){
            sampleItemCore.selectFiles[index]=fileURL.toString()

        }
        else{
            sampleItemCore.selectFiles[index]=""
        }

    }

    ColumnLayout{
        anchors.fill: parent
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true

            SelectRectangle{
                anchors.centerIn: parent
                width: parent.width*0.98
                height: parent.height*0.98
                visible: slected
            }
            Item{
                anchors.centerIn: parent
                width: parent.width*0.95
                height: parent.height*0.95
                Image {
                    anchors.fill: parent
                    id: name
                    fillMode: Image.PreserveAspectFit
                    source: fileURL
                }
            }
        }
    }
    Drag.dragType: Drag.Automatic
    Drag.supportedActions: Qt.MoveAction
    Drag.mimeData: {
        "text/uri-list":urlsT
    }
    Drag.active: false
    Item{
        anchors.fill: parent
        DragHandler {
            id: dragHandler
            onActiveChanged:
                if (active) {

                    urlsT = sampleItemCore.getUrls()
                    root.grabToImage(function(result) {
                        root.Drag.imageSource = result.url
                        root.Drag.active = true
                    })
                } else {
                    root.Drag.active = false
                }
        }
    }

    TapHandler {
        id: handler
        acceptedModifiers:Qt.NoButton
        //                 acceptedModifiers: Qt.ControlModifier|Qt.ShiftModifier
        //                acceptedButtons: Qt.LeftButton|Qt.RightButton
        onTapped: {
            if(slected){
                slected=false
            }
            else
                slected=true

            if (handler.modifiers & Qt.ControlModifier) {
                if(slected){
                    slected=false
                }
                else
                    slected=true
            }
            if (handler.modifiers & Qt.ShiftModifier) {
                sampleItemCore.selectFiles[index]=fileURL.toString()
            }
        }
        onDoubleTapped: {
            Qt.openUrlExternally(fileURL)// #双击
        }
    }
    TapHandler{
        acceptedButtons:Qt.RightButton
        onTapped: {
            openMenu()

        }
    }
    TapHandler{
        acceptedModifiers: Qt.ControlModifier
        onTapped: {
            console.log("acceptedButtons")
            if(slected){
                slected=false
            }
            else
                slected=true
        }

    }


    //     MouseArea{
    //        anchors.fill: parent

    //        onClicked: {
    //            if(slected){
    //                slected=false
    //            }
    //            else
    //                slected=true
    //        }
    //        onDoubleClicked: {
    //            Qt.openUrlExternally(fileURL)// #双击
    //        }


    //    }

}

