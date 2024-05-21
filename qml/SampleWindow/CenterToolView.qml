import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "Center"

// 中央控制
Item {
    id:root
    property string state:"exited"

    function isFolder(url) {
        return url.lastIndexOf(".") === -1;
    }

    Menu{
        id:menu
        MenuItem{
            text: "打开路径"
            onTriggered: {
                Qt.openUrlExternally(sampleCore.defectListUrl)
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: {
            if (mouse.button == Qt.RightButton){
                menu.popup()
            }
        }
    }
    ColumnLayout{
        anchors.fill: parent

        CenterView{
        Layout.fillHeight: true
        Layout.fillWidth: true

    }
        Row{
                        Layout.alignment: Qt.AlignHCenter
                        spacing: 10
        Button{
            text: "预测"
            onClicked: {
                openTest()
            }
        }
        Button{
            text: "训练"
            onClicked: {
                openTrainWindow()
            }
        }
        }
    }


    DropArea{
        // 设置 缺陷 list
        id:dropArea
        anchors.fill: parent
        onEntered: (drop)=>{
                       console.log("entered")
                       if (drop.hasUrls &&  isFolder(drop.urls[0].toString())) {

                           console.log(drop.urls[0])
                           sampleCore.defectListUrlSetting=true
                           sampleCore.tempDefectListUrl = drop.urls[0]
                       }
                       root.state = "entered"
                   }
        onExited: (drop)=>{
                      console.log("exited")
                      sampleCore.defectListUrlSetting=false
                      root.state = "exited"
                  }
        onDropped: (drop)=>{
                       console.log("dropped")
                       sampleCore.defectListUrl=drop.urls[0]
                       sampleCore.defectListUrlSetting=false
                       root.state = "dropped"
                   }
    }



}
