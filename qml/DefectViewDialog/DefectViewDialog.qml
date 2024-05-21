import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Base"
Dialog {
    id: popup
    property int mouseX: 0
    property int mouseY: 0
    property alias hovered: hov.hovered
    property bool canClose: false
    property bool clo: canClose&&!hovered
    onCloChanged: {
        if(clo){
            close()
        }
    }
    property var clickFunc
    property var defectItemData: {return{
            defectCoefficient:0,
            defectX:0,
        }
    }
    property var t: {
    return  {"defectNo":5037857,
            "defectID":11,"bmIndex":0,"seqNo":618742,
            "cameraId":3,"imageIndex":3,"defectX":3871,
            "defectY":3824,"defectWidth":94,"defectHeight":344
            ,"rec":[{},{},{},{}],"box":[{},{},{},{}],"boxX":3480,"boxY":799,"boxW":344,"boxH":94,"defectCoefficient":"0 %"}

    }

    parent: id_app
    function openPopup(defectItemData,x_,y_,clickFunc){
        canClose=false
        popup.defectItemData = defectItemData
        mouseX=x_
        mouseY=y_
        image.source=api.getImage(defectItemData.cameraId,defectItemData.defectNo)
        popup.open()
    }
    x: mouseX-popup.width/2
    y: mouseY - image.height -0.2*dpi


    function tryClose(){
        canClose=true
    }

    width: image.width
    height: image.height
    modal: false
    focus: true
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    background: Item{}
    EffectImage {
        id: image
        source: ""
        width: sourceSize.width
        height:sourceSize.height
        horizontalOffset:6
        verticalOffset:6
    }
    enter: Transition {
        NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 ;duration:400}
    }
    exit: Transition {
        NumberAnimation { property: "opacity"; from: 1.0; to: 0.0;duration:400 }
    }
    MsgView{
        x:image.width
        height:image.height
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            clickFunc()
        }
        onDoubleClicked: {}
    }
    HoverHandler{
        id:hov
    }
}
