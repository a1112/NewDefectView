import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15

Menu {
    property string source_url: ""
    ListModel{
        id:t_defect
    }
    MenuItem{
        text:"自动播放"
    }
    MenuItem{
        text: qsTr("查看原图 ")
        onClicked: {
            let url=source_url//
            console.log(url)
            sdm.openMaxImageDialogView(url,t_defect)


        }

    }
    Menu{
        title: qsTr("布局")

        MenuItemComp{
            text:"左右布局"
            onClicked:imageViewCore.layoutType=imageViewCore.layoutHorizontal
            selected:imageViewCore.layoutType==imageViewCore.layoutHorizontal
        }
        MenuItemComp{
            text:"上下布局"
            onClicked:imageViewCore.layoutType=imageViewCore.layoutVertical
            selected:imageViewCore.layoutType==imageViewCore.layoutVertical
        }
        MenuItemComp{
            text:"仅上表"
            onClicked:imageViewCore.layoutType=imageViewCore.layoutTop
            selected:imageViewCore.layoutType==imageViewCore.layoutTop
        }
        MenuItemComp{
            text:"仅下表"
            onClicked:imageViewCore.layoutType=imageViewCore.layoutBottom
            selected:imageViewCore.layoutType==imageViewCore.layoutBottom
        }
    }
    Menu{
        title: qsTr("标记缺陷")
MenuItemComp{
    id:md
    text: qsTr("标记:"+(imageViewCore.is_imageMarkDefect?"开":"关"))
    selected:imageViewCore.is_imageMarkDefect
    onClicked: {
        if (imageViewCore.is_imageMarkDefect)
        imageViewCore.imageShowModel=imageViewCore.imageViewModel
        else
            imageViewCore.imageShowModel=imageViewCore.imageCrateDefectModel
    }
}
MenuItem{
    text: qsTr("清空当前标注")
    enabled: user_defctsModel.count>0
    onClicked: {
        user_defctsModel.clear()
    }
}
MenuItem{
    text: qsTr("提交当前标注")
    enabled: user_defctsModel.count>0
    onClicked: {
        defectCreatCore.acceptDefects()
    }
}

    }

    Menu{
        title: "坐标"


        MenuItemComp{
            text: qsTr("十字坐标:"+(imageViewCore.imageCrossView?"开":"关"))
            selected:imageViewCore.imageCrossView
            onClicked: {
                imageViewCore.imageCrossView=!imageViewCore.imageCrossView
            }
    }
        MenuItemComp{
            text: qsTr("刻度:"+(imageViewCore.imageScaleView?"开":"关"))
            selected:imageViewCore.imageScaleView
            onClicked: {
                imageViewCore.imageScaleView=!imageViewCore.imageScaleView
            }
    }

    }

    Menu{
        title: qsTr("图像查看模式")
        MenuItemComp{
            text: qsTr("流畅滚动")
            selected: coreState.currentImageMoveModel==coreState.imageScrollModel
            onClicked:coreState.currentImageMoveModel=coreState.imageScrollModel
        }
        MenuItemComp{
            text: qsTr("单帧跳转")
            selected: coreState.currentImageMoveModel==coreState.imageChangeModel
            onClicked: coreState.currentImageMoveModel=coreState.imageChangeModel
        }
        Menu{
            title: qsTr("跳转速度(单帧下有效)")
            MenuItemComp{
                text: qsTr("0.25(25%显示高度)")
                selected: coreState.changeHeightSpeed==0.25
                onClicked: coreState.changeHeightSpeed=0.25
            }
            MenuItemComp{
                text: qsTr("0.5")
                selected: coreState.changeHeightSpeed==0.5
                onClicked: coreState.changeHeightSpeed=0.5
            }
            MenuItemComp{
                text: qsTr("0.75")
                selected: coreState.changeHeightSpeed==0.75
                onClicked: coreState.changeHeightSpeed=0.75
            }
            MenuItemComp{
                text: qsTr("1（100%显示高度）")
                selected: coreState.changeHeightSpeed==1
                onClicked: coreState.changeHeightSpeed=1
            }
        }
    }

    Menu{
        title: qsTr("缩放（降低网络负担）")
    MenuItemComp{
        text: qsTr("100%(最高质量)")
        selected: coreState.imageZoom==1
        onClicked: coreState.imageZoom=1
    }
    MenuItemComp{
        text: qsTr("75%")
        onClicked:coreState.imageZoom=0.75
        selected: coreState.imageZoom==0.75
    }
    MenuItemComp{
        text: qsTr("50%")
        onClicked:coreState.imageZoom=0.5
        selected: coreState.imageZoom==0.5
    }
    MenuItemComp{
        text: qsTr("25%(最快速度)")
        onClicked:coreState.imageZoom=0.25
        selected: coreState.imageZoom==0.25
    }
    }

    Menu{
       title: qsTr("缺陷显示")
            MenuItem{
            text: qsTr("显示:"+(imageViewCore.imageSystemCanViewDefect?"开":"关"))
                onClicked: {
                    imageViewCore.imageSystemCanViewDefect=!imageViewCore.imageSystemCanViewDefect
                }
       }
            MenuItem{
            text: qsTr("文字:"+(imageViewCore.showDefectText?"开":"关"))
                onClicked: {
                    imageViewCore.showDefectText=!imageViewCore.showDefectText
                }
       }
            MenuItem{
            text: qsTr("悬停放大："+(imageViewCore.autoShowMaxImageView?"开":"关"))
            onClicked: {
                imageViewCore.autoShowMaxImageView=!imageViewCore.autoShowMaxImageView
            }
            }
    }

    Menu{
        title: qsTr("调试...")
        MenuItemComp{
            text: qsTr("显示图像边框")
            selected: coreState.imageShowBolderView
            onClicked: coreState.imageShowBolderView=!coreState.imageShowBolderView
        }
    }
}
