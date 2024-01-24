import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "ImageListViewItem"
Item{
    property real cellWidthScale: steelLevelCore.cellWidthScale
    property int cellWid: 200*cellWidthScale
    property bool keyOn: false
//    GridView {
//        interactive :!keyOn
//        anchors.fill: parent
//        model: steelLevelCore.defectListModel
//        cellWidth: cellWid
//        cellHeight: cellWid
//        clip: true
//        currentIndex:steelLevelCore.currentIndex
//        highlight:Rectangle{
//            color: "#00000000"
//            border.width: 3
//            border.color: Material.accentColor
//        }
//        delegate: ImageListViewItemView{
//        }
//    }
Flickable{
    id:flick
    clip: true
    interactive :!keyOn
    anchors.fill: parent
    contentHeight: flow.height
    Flow{
        id:flow
        width: parent.width
    Repeater{
        id:rep
        model: steelLevelCore.defectListModel
        delegate: ImageListViewItemView{
        }
    }




    }

}
FocusScope{
id:fc
focus: true
Keys.onPressed: (event)=>{
               keyOn=true
                }
Keys.onReleased: {
                keyOn=false
    console.log(Keys.onReleased)
}
}
    WheelHandler{
        id:wh
        enabled: keyOn
        acceptedModifiers: Qt.ControlModifier
        onWheel: (event)=> {
                                if(event.angleDelta.y>0){
                                   steelLevelCore.cellWidthScale*=1.1
                                }
                                else{
                                   steelLevelCore.cellWidthScale/=1.1
                                }
                                if (steelLevelCore.cellWidthScale<0.5)
                                    steelLevelCore.cellWidthScale=0.5
                            }

    }
}
