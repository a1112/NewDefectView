import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "ImageViewWindow"
import "../Comps/SimpleList"
import "../Base"
import "../Comps"
import "../CrossView"
import "../btns"
import "DefectCreatCore"
Rectangle{
    property bool selectCanView: false
    id:root
    // 图像分析
    property int hovendIndex: - 1 // 鼠标停留的相机值
    property int imageShowWidth:imageCore.maxImageModel===imageCore.imageShowModel?width: width/cameraCount
    property bool crossVisible: imageViewCore.imageCrossView&&imageViewCore.focusItem==isTop
    property int imageShowHeight: imageShowWidth*coreConfig.aspectRatio
    property int globalContentY: showImageIndex*imageShowHeight
    property real showImageIndex: 0
    property HoverHandler hh
    property ImageViewWindowItem startRoot

    property real point_x: hh.point.position.x+startRoot.x  //  鼠标 x 坐标
    property real point_y: hh.point.position.y+flick.contentY  // 鼠标 y 坐标

    property int showInageIndex_x:imageCore.isMaxImageModel?
                                      parseInt(point_x/imageShowWidth)+hovendIndex
                                      : parseInt(point_x/imageShowWidth)
    property int showInageIndex_y: parseInt(point_y/imageShowHeight)

    property int hovendCameraId: 0

    property real currentImageScale: imageShowWidth/coreConfig.imageWidth
    property DefectCreatCore defectCreatCore: DefectCreatCore{}     // 缺陷标注功能部分
    property ListModel user_defctsModel: defctsUserModel
    Keys.enabled: true
    focus: true
    Keys.onUpPressed: {
        flick.flick(flick.contentX,flick.contentY+ imageViewCore.imageViewSpeed/2)
    }
    Keys.onDownPressed: {
        flick.flick(flick.contentX,flick.contentY- imageViewCore.imageViewSpeed/2)
    }
    Row {
        anchors.fill: parent
        spacing: 0
        Repeater{
            model:cameraListMiodel
            ImageViewWindowItem{ // 每个相机显示的区域
                id:ivwi
                anchors.top: parent.top
                property int imshowWidth: imageCore.isMaxImageModel?
                                              index===imageCore.hoverdListIndex?imageShowWidth:0
                :imageShowWidth
                visible:width
                viewActive:imshowWidth
                width:imshowWidth
                Behavior on width {NumberAnimation{duration: 450}}
                height: parent.height
                HoverHandler{
                    onHoveredChanged: {
                        if(hovered){
                            hovendIndex=index
                            hovendCameraId=ivwi.cameraIndex
                            hh=this
                            startRoot=parent
                            imageCore.hoverdListIndex=index
                            imageViewCore.focusItem=isTop
//                            console.log("onHoveredChanged")
                            root.focus=true
                            root.forceActiveFocus()
                        }
                    }
                }
                MouseArea{
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    onClicked: {
                        imageViewCore.menu_cacameraIndex=hovendCameraId
                        imageViewCore.menu_imageIndex=showInageIndex_y
                        imageViewMenu.popup()
                    }
                }
            }
        }
    }

    FpsItem{
    }

    Flickable{
        focus: true
        id:flick
        anchors.fill: parent
        contentWidth: root.width
        maximumFlickVelocity:imageViewCore.imageViewSpeed
        clip: true
        interactive: !imageViewCore.is_imageMarkDefect && !(coreState.currentImageMoveModel==coreState.imageChangeModel)
        property int globalY: imageViewCore.globalContentY
        onGlobalYChanged: {
            if (!(imageViewCore.focusItem===isTop&&imageViewCore.linkX) ||coreState.currentImageMoveModel==coreState.imageChangeModel){
                contentY=imageViewCore.globalContentY
            }
        }
        property int currentSteelIndex: coreState.currentSteelIndex
        onCurrentSteelIndexChanged: {
            contentY=0
        }
        contentHeight: (imageViewCore.linkX?coreState.maxMaxImageCount:imageCount)*imageShowHeight
        onContentYChanged:{
            showImageIndex=contentY/imageShowHeight
            if(imageViewCore.focusItem===isTop && imageViewCore.linkX){
                imageViewCore.globalContentY=contentY
            }
        }
        MouseArea{
            anchors.fill: parent
            onDoubleClicked: {
                imageCore.changeModel()
                flick.contentY=globalContentY
            }
        }
        Repeater{
            model: defctsModel
            DefecShowItemItem{
                visible: imageViewCore.imageSystemCanViewDefect &&
                         (!imageCore.isMaxImageModel||imageCore.hoverdListIndex == cameraId-cameraStartIndex)
                offsetX:imageCore.isMaxImageModel&&imageCore.hoverdListIndex == cameraId-cameraStartIndex ?0:(cameraId-cameraStartIndex)*imageShowWidth
                offsetY:imageIndex*imageShowHeight
                HoverHandler{
                    enabled: imageViewCore.autoShowMaxImageView && !imageViewCore.listHovered
                    onHoveredChanged: {
                        if(hovered){
                            defectViewDialog.openPopup(defctsModel.get(index),
                                                       point.scenePosition.x,
                                                       point.scenePosition.y,
                                                       ()=>defectViewControl.appendSelectItem(index,defectViewModel.get(index)))
                        }
                        else{
                            defectViewDialog.tryClose()
                        }
                    }
                }
            }
        }

        Repeater{// 缺陷显示
            model: user_defctsModel
        UserDefecShowItemItem{
        }
        }

        SelectItem{
            visible: selectCanView
            id:sel
        }
        MouseArea{
            enabled: imageViewCore.is_imageMarkDefect
            id:mouse
            cursorShape: imageViewCore.is_imageMarkDefect?Qt.ArrowCursor: Qt.TouchPointMoved
            anchors.fill: parent
            onDoubleClicked:{
                if (user_defctsModel.count>0)
                    defectCreatCore.openAceeptDialog()
                else
                    imageViewCore.imageShowModel=imageViewCore.imageViewModel
            }
            onPressed:{
                coreState.isCHmodel=false
                if (coreState.currentImageMoveModel==coreState.imageChangeModel)coreState.isCHmodel=true
                else coreState.currentImageMoveModel=coreState.imageChangeModel
                selectCanView=true
                sel.startX=mouse.x
                sel.startY=mouse.y
                sel.endX=mouse.x
                sel.endY=mouse.y
//                defectViewState.selectRec=Qt.rect(sel.minX,sel.minY,sel.maxX,sel.maxY)
            }
            onPositionChanged: {

                if (selectCanView){
                    sel.endX=mouse.x
                    sel.endY=mouse.y
//                    defectViewState.selectRec=Qt.rect(sel.minX,sel.minY,sel.maxX,sel.maxY)
                }
            }
            onReleased: {
                if (sel.maxX-sel.minX>5 && sel.maxY-sel.minY){
                    defectC_Menu.popup()
                    user_defctsModel.append(
                                    {
                                defectID:0,
                                boxX:sel.minX/currentImageScale,
                                boxY:sel.minY/currentImageScale,
                                boxW:(sel.maxX-sel.minX)/currentImageScale,
                                boxH:(sel.maxY-sel.minY)/currentImageScale
                                }
                                )
                Qt.rect(sel.minX,sel.minY,sel.maxX,sel.maxY)
                selectCanView=false
                }
            }
        }
        Item{
            clip: true
            width:flick.contentWidth
            height: flick.contentHeight
            CrossView{
                id:cross
                crossVisible_:crossVisible
                cross_x: point_x
                cross_y: point_y
                hovendIndex:root.hovendIndex
                labelY:flick.contentY

            }

        }


        ScrollBar.vertical: ScrollBarBase{
            policy :ScrollBar.AlwaysOn
        }
        Component.onCompleted: {
            if(isTop){
                imageViewCore.flickA=this
            }
            else{
                imageViewCore.flickB=this
            }
        }
    }
    ActiveMenuBar{}
    DefectMapView{

        height: root.height
        anchors.right: parent.right
    }
    Item{
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        width: 0.5*dpi
        height: width
        Item{
            width: 0.3*dpi
            height: width
            anchors.centerIn: parent
            MoreSet{
                anchors.fill: parent
                onClicked: {
                    imsetMenu.popup()
                }
            }
        }
    }

    WheelHandler{
        enabled: coreState.currentImageMoveModel==coreState.imageChangeModel
        onWheel:(event)=> {
                    if(event.angleDelta.y>0){
                        imageViewCore.globalContentY=Math.max(imageViewCore.globalContentY-flick.height*coreState.changeHeightSpeed,0)
                    }
                    else{
                        imageViewCore.globalContentY=Math.min(imageViewCore.globalContentY+flick.height*coreState.changeHeightSpeed,
                                                              flick.contentHeight-flick.height)
                    }
                }
    }


    ImageSetingMenu{
        id:imsetMenu
    }
    ImageViewMenu{  // 菜单
        onVisibleChanged: imageViewCore.menuVisible=visible
        id:imageViewMenu
        source_url:api.getCimg(hovendCameraId,coreState.currentSteelId,showInageIndex_y,coreConfig.imageWidth)
    }


    DefectCrateMenu{
        id:defectC_Menu
        property int selectId: -1
        onClick: {
            selectId=_id
            this.close()
        }
        onOpened: {
        selectId=-1
        }
        onClosed: {
            if (selectId>-1){
            user_defctsModel.setProperty(user_defctsModel.count-1,"defectID",selectId)
            }
            else{
            user_defctsModel.remove(user_defctsModel.count-1)
            }
        }
    }


}
