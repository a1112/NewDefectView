import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15



import "Samp"
import "ApiCore"
ApplicationWindow {
    flags: Qt.Dialog
    id:trainWindow
    visible: true
    width: 640
    height: 800
    title: qsTr("训练")
    property alias treainIndex: trainModel.currentIndex

    property Api trainApi: Api{}

    ColumnLayout {
        anchors.fill: parent

        SampServer{

        }

        SampModelChange{
            id:trainModel
            title: "训练模式"
        }
        FileSalectSample{
            title: "配置文件路径"
            onValueChanged: {
            // 配置文件路径改变
                trainApi.trainConfigFilePath = value
                trainApi.trainConfig["value"]=value
            }
        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Flickable{
            anchors.fill: parent
            contentWidth:image.width
            contentHeight:image.height
            clip: true
            ScrollBar.vertical: ScrollBar{}
            ScrollBar.horizontal: ScrollBar{}
            Image {
                id: image
                source:trainApi.lexer_image
            }
            }
//            WebView {
//                    anchors.fill: parent
//                    url: "data:text/html;charset=utf-8,"+trainApi.lexer_text
//                }



//            SettingPage{
//            }
//            StackLayout{
//                anchors.fill: parent
//                currentIndex: trainModel.currentIndex
//                ClassificationSettingPage{
//                    Layout.fillWidth: true
//                    Layout.fillHeight: true
//                }
//                Item{
//                    Layout.fillWidth: true
//                    Layout.fillHeight: true
//                }
//                Item{
//                    Layout.fillWidth: true
//                    Layout.fillHeight: true
//                }
//            }
        }
        Button{
            Layout.alignment: Qt.AlignHCenter
            text: "开始训练"
            onClicked: {
                trainApi.train()
            }
        }
    }

}
