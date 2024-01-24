import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../Base"
Menu {
    id:root
    height: dpi*2
    width: Math.min(list.contentWidth,id_app.width*0.7)
    property bool canClose: false
    property var value

    ListModel{
        id:defectShowListmodel
        dynamicRoles:true
    }
    function appendDefectOne(defect){
        defectShowListmodel.append(defect)
    }
    function myPopup(popListData){
        defectShowListmodel.clear()
        if (popListData[1])
        popListData[1].forEach((value,index)=>{
                                   value["up"]=1
                                   root.value=value
                                   appendDefectOne(value)
                            })
        if (popListData[0])
        popListData[0].forEach((value,index)=>{
                                   value["up"]=0
                                   root.value=value
                                   appendDefectOne(value)
                            })
        canClose=false
        closeTime.stop()
        root.popup()
    }

    Timer{
        id:closeTime
        interval: 1500
        onTriggered: {
            if(hh.hovered){
            }
            else if(scrollbar.active){
                restart()
            }
            else
                close()
        }
    }
    function closePopup(){
        canClose=true
        closeTime.restart()
    }
    Item{
        width: root.width
        height: root.height-0.1*dpi
    ScrollBarBase2 {
                id:scrollbar
                anchors.bottom: list.bottom
                width:list.width
                height: 0.1*dpi
                    }
    ListView{
        y:0.05*dpi
        spacing: 0.05*dpi
        id:list
        orientation: Qt.Horizontal
        width: root.width
        height: root.height-0.1*dpi
        model:defectShowListmodel
        delegate: ItemDefectViewDelegate{}

        ScrollBar.horizontal:scrollbar
    }
    HoverHandler{
        id:hh
        onHoveredChanged: {
            if(hovered){
                closeTime.stop()
            }
            else if(canClose){
                closePopup()
            }
        }
    }
    }

}
