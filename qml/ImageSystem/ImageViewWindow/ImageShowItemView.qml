import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../Comps"
import "../../Base"
import QtGraphicalEffects 1.14
Item {

    property bool isMenuVisibleItem: imageViewCore.menuVisible &&
                                     cameraIndex == imageViewCore.menu_cacameraIndex&&
                                     index==imageViewCore.menu_imageIndex


    width: Math.max(list.width,1)
    height:imageShowHeight//width*coreConfig.aspectRatio
    property bool displayView: list.contentY-imageShowHeight*cacheNum
                               <index*imageShowHeight&&
                               index*imageShowHeight<list.contentY+list.height+
                               imageShowHeight*cacheNum
    property bool showActive: viewActive
    property bool canLoaded: displayView&&showActive
    property int currentSteelId: coreState.currentSteelId
    function flushImage(){
        if(canLoaded){
            image2.source=""
            image.source=api.getCimg(cameraIndex,currentSteelId,index,parseInt(imageShowWidth*coreState.imageZoom))
        }
    }
    function flushImage2(){
        if(canLoaded){
            image2.source=api.getCimg(cameraIndex,currentSteelId,index,parseInt(imageShowWidth*coreState.imageZoom))
        }
    }
    onWidthChanged: {
        //        image.source=""
        flushImage2()
    }
    onCurrentSteelIdChanged: {
        image.source=""
        flushImage()
    }
    onCanLoadedChanged: {
        flushImage()
    }
    Image {
        id: image
        asynchronous: true
        width: parent.width
        height: parent.height
        //        sourceSize: Qt.size(imageShowWidth,imageShowHeight)
        //  "file:///F:/3d测试/新建文件夹/ckg_20220614093658_000022.bmp"
    }
    Image {
        id: image2
        source: image.source
        asynchronous: true
        width: parent.width
        height: parent.height
        onStateChanged: {
            if (image2.status  == Image.Ready){
            }
            else{
                console.log("image error")
            }
        }
        //        sourceSize: Qt.size(imageShowWidth,imageShowHeight)
        //  "file:///F:/3d测试/新建文件夹/ckg_20220614093658_000022.bmp"
    }
    BrightnessContrast{
        id:bc
        visible: enabled
        //enabled: imageCore.brightness||imageCore.contrast
        anchors.fill: image2
        brightness:imageCore.brightness/100
        contrast: imageCore.contrast/100
        source:image2
    }
    //    MaxImageComp{
    //id: image
    //asynchronous: true
    //currentImageScale: parent.width/parent.height
    //    }
    BorderView{
        border.color: isMenuVisibleItem?"blue":"#55dddddd"
        Label{
            // anchors.right: parent.right
            color: "red"
            text: index
            font.pixelSize: 20
        }

        anchors.fill: parent
        visible: coreState.imageShowBolderView ||isMenuVisibleItem
//        Column{
//            Label{
//                text:"info"
//            }
//    Label{
//        text:image.status
//    }
//    Label{
//        text:image2.status
//    }
//        }
    }


    Column{
        spacing: 1
        visible: cameraViewIndex==0 && imageViewCore.imageScaleView
        Rectangle{
               color: "red"
               width: 35
               height: 1
               }
    Label{
        anchors.right: parent.right
        color: "red"
        font.pointSize: 9
        text:imageViewCore.imageWidthInfoList[0]["steelLen"][index]/1000+" m"
        font.family: "微软雅黑"
        background: Rectangle{
        color: "#000"
        }
    }
    }



}
