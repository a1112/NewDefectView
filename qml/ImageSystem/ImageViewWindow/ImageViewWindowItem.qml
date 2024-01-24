import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../Comps"
/*
show a camera Window
*/
Rectangle{
    color: "#1e1e1e"
    id:root
    clip: true
    property int cacheNum: 4
    property int cameraViewIndex: index //相机的排序

    property int cameraIndex: index+cameraStartIndex
    property bool viewActive: true
    property int offsetY : 0
    ListView{
        anchors.top: parent.top
        interactive: false
        id:list
        width: root.width
        height: root.height
        cacheBuffer: Math.max(200*imageShowHeight,1000)
        model:imageCount
        contentY:globalContentY+offsetY
        onContentYChanged: {
        }
        delegate: ImageShowItemView{
            onYChanged: {
                if(index===0)
                offsetY=y
            }
        }
    }
}
