import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

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
        cacheBuffer: Math.max(200*1024,1000)
        model:imageCount
        delegate:Rectangle{
            width: root.width
            height: 200
            border.width: 1
            border.color: "red"
        }
//            ImageShowItemView{
//            onYChanged: {
//                if(index===0)
//                offsetY=y
//            }
//        }
    }
}
