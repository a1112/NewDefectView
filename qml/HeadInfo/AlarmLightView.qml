import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../Base"
import "../Labels"
import "../btns"
Row{
    id:root
    spacing: 0.05*dpi
    Row{
        spacing: 0.05*dpi
        anchors.verticalCenter: parent.verticalCenter
        PreBtn{
            enabled: coreState.hasPreSteel
            onClicked: {
                control.changeToPreSteel()
            }
        }
        NextBtn{
            enabled: coreState.hasNextSteel
            onClicked: {
                control.changeToNextSteel()
            }
        }
        Item{
            width: 0.1*dpi
            height: 1
        }
    }
    Component{
        id:alarmLightViewItem
        Rectangle{
            border.color: "#000000"
            color:  Material.color(Material.Green)
            border.width: 0.025*width
            LabelBase{
                y :parent.height*0.1
                anchors.horizontalCenter: parent.horizontalCenter
                text: show_text2
            }
        }
    }
    LabelBase{
        id:lab_state
        anchors.verticalCenter: parent.verticalCenter
        font.bold: true
        font.pixelSize: dpi*0.2
        color: Material.color(Material.Teal)
        text: " 正在检测 ..."
        visible: coreState.detState
        SequentialAnimation{
            running: coreState.detState
            loops: Animation.Infinite
            ColorAnimation{
                duration: 2000
                target: lab_state
                property:"color"
                from:Material.color(Material.Yellow)
                to:Material.color(Material.Green)
            }
            ColorAnimation{
                duration: 2000
                target: lab_state
                property:"color"
                from:Material.color(Material.Green)
                to:Material.color(Material.Yellow)
            }
        }
    }
    DateTimeLab{    // 当前的时间
        anchors.verticalCenter: parent.verticalCenter
    }

    Row{
        visible: upAppCore.hasUpAppVersion
        ItemDelegateButtonBase{
            tipText:"客户端升级"
            height: parent.height
            width: height
            onClicked: {
                upAppCore.openUpApp()
            }
            source: coreStyle.getIcon("upApp")
        }
        ItemDelegate{
            text: "客户端升级: "+upAppCore.newVersion
            font.pointSize: 14
            onClicked: upAppCore.openUpApp()
        }
    }

    ItemDelegateButtonBase{
        tipText:"服务器重启"
        height: parent.height
        width: height
        onClicked: {
            api.restartServer(
                        )
        }
        source: coreStyle.getIcon("restart")
    }
    ItemDelegateButtonBase{
        tipText:qsTr("测试")
        height: parent.height
        width: height
        onClicked: {
            testView.visible=testView.visible?false:true
        }
        source: coreStyle.getIcon("debug")
    }
    ItemDelegateButtonBase{
        tipText:qsTr("工具箱")
        height: parent.height
        width: height
        onClicked: {
            sub.open()
        }
        source: coreStyle.getIcon("tool")
    }
    WindowModelChangeButton{
        tipText:qsTr("全屏/取消全屏")
        height: parent.height
        width: height
        shouMaxIcon:id_app.visibility===Window.FullScreen
        onClicked: {

            id_app.visibility=id_app.visibility!==Window.FullScreen?Window.FullScreen:Window.Windowed
        }
    }
    ItemDelegateButtonBase{
        tipText:qsTr("关于")
        height: parent.height
        width: height
        onClicked: {
            abortMenu.popup()
        }
        source: coreStyle.getIcon("help")

    }
    Menu{
        id:abortMenu
        MenuItem{
            text: "API 文档"
            onClicked: Qt.openUrlExternally(api.getDoc())
        }
        MenuItem{
            text: "开发信息"
            onClicked: {

            }
        }
    }
    ItemDelegateButtonBase{
        tipText:qsTr("设置")
        source: coreStyle.getIcon("setting")
        height: parent.height
        width: height
        onClicked: openSett()
    }
    //    Repeater{
    //        model:
    //            ListModel{
    //            ListElement{
    //                show_text: "周期性缺陷报警"
    //            }
    //            ListElement{
    //                show_text: "严重划伤报警"
    //            }
    //            ListElement{
    //                show_text: "系统参数"
    //            }
    //        }
    //        delegate: Loader{
    //            property var show_text2: show_text
    //            height: root.height
    //            width: height*2.5
    //            sourceComponent: alarmLightViewItem
    //        }
    //    }

}

