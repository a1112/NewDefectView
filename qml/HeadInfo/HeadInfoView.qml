import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import '../Icons'
import '../Base'
import "../Labels"
import "../btns"
/*
一些按钮与信息
*/
Item {
    //    color: '#F2EFEE'
    Pane{
        Material.elevation: autoSize.elevation
        anchors.fill: parent
    }
    id:root
    RowLayout{
        anchors.fill: parent
        spacing:2
        Item{
            height: root.height
            width:id_icon.width
            Company2Icon{
                id:id_icon
                height:root.height
                MouseArea{
                    acceptedButtons: Qt.AllButtons
                    anchors.fill: parent
                    onClicked:{
                        if(mouse.button===Qt.RightButton){
                            systemMenu.popup()

                        }
                        else{
                            coreStyle.changeStyle()
                        }
                    }
                }
            }
        }
        Repeater
        {
            model: [{show_text:"缺陷分析"},
                {show_text:"缺陷类别"},
                {show_text:"报警设置"},
                {show_text:"历史记录"},
                {show_text:"查询"}]
            delegate:
                Item{
                height: root.height*0.8
                width: 2*height
                Button{
                    anchors.fill: parent
                    text: modelData["show_text"]
                    font.pixelSize: autoSize.titleButtonTextSize//0.15*dpi
                    font.bold: true
                    onClicked: {
                        console.log("点击了 "+modelData["show_text"])
                        if (modelData["show_text"]==="缺陷类别"){
                            sdm.openDefectInfoDialogs()
                        }
                        else if (modelData["show_text"]==="查询"){
                            sdm.openSearchDialog()
                        }
                        else if (modelData["show_text"]==="历史记录"){
                            coreModels.listViewType=coreModels.realViewType
                            control._selectLastModelItem()
                        }
                    }
                }}
        }
        TabBar{
            height: root.height
            currentIndex:appGlobal.appTypeAll.indexOf(appGlobal.appType)
            onCurrentIndexChanged: {
                appGlobal.appType = appGlobal.appTypeAll[currentIndex]
            }
            TabButton {
                width:dpi
                font.pixelSize: autoSize.titleButtonTextSize
                font.bold: true
                text: qsTr("图像分析")
            }
            TabButton {
                width:dpi
                font.pixelSize: autoSize.titleButtonTextSize
                font.bold: true
                text: qsTr("缺陷分析")
            }
            //                TabButton {
            //                    width:dpi
            //                    font.pixelSize: autoSize.titleButtonTextSize
            //                    font.bold: true
            //                    text: qsTr("缺陷（小图模式）")
            //                }
            TabButton {
                width:dpi
                font.pixelSize: autoSize.titleButtonTextSize
                font.bold: true
                text: qsTr("离线判级")
            }
        }
        Button{
            font.pixelSize: autoSize.titleButtonTextSize
            visible: coreModels.listViewType!=coreModels.realViewType
            text: "退出查询"
            Material.background: Material.Blue
            onClicked: {
                coreModels.listViewType=coreModels.realViewType
            }
        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Item{
            width: row.width
            height: row.height
            ItemDelegate{
                anchors.fill: parent
                onClicked: {
                    linkView.open()
                }
            }
            SwitchButton{
                height: lt.height
                width: height
                anchors.right: parent.right
                onClicked: {
                    linkView.open()
                }
            }
        Column{
            id:row
            LabelBase{
                anchors.horizontalCenter: parent.horizontalCenter
                id:lt
                font.pixelSize: autoSize.titleButtonTextSize*1.6
                text: api.apiConfig.msg

            }
            LabelBase{
                id:lbi
                anchors.horizontalCenter: parent.horizontalCenter
                text: api.apiConfig.serverUrl +"("+api.apiConfig.serverDelayed+"ms)"
                color: api.apiConfig.serverDelayed>-1?"green":"red"
            }
        }


        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        SwitchDelegate{
            font.pixelSize: autoSize.titleButtonTextSize
            text: qsTr("实时刷新("+coreState.realTime+")")
            checked:coreState.realAutoType
            onCheckedChanged: {
                coreState.realAutoType=checked
            }
        }
        AlarmLightView{
            height: root.height*0.8
        }
    }

    Menu{
        id:systemMenu
        MenuItem{
            enabled:appGlobal.appType!==appGlobal.imageType
            text: qsTr("图像分析控制台")
            onClicked: {
                appGlobal.appType=appGlobal.imageType
            }
        }
        MenuItem{
            enabled:appGlobal.appType!==appGlobal.defectType
            text: qsTr("缺陷分析控制台")
            onClicked: {
                appGlobal.appType=appGlobal.defectType
            }
        }
        MenuItem{
            enabled:true
            text: qsTr("离线判级")
            onClicked: {
                appGlobal.appType=appGlobal.steelLevelType
            }
        }
        MenuItem{
            enabled:true
            text: qsTr("样本分析")
            onClicked: {
                appGlobal.appType=appGlobal.minImageDefectType
            }
        }
    }


}
