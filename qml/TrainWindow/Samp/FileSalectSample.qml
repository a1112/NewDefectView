import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import QtQuick.Dialogs 1.3
SampBase {

    FileDialog{
        id:file_dialog
        onAccepted: {
            console.log("Accepted")
            value = file_dialog.fileUrl.toString().replace("file:///","")
             Qt.openUrlExternally(file_dialog.fileUrl.toString())
        }
    }

    item: Row{

        TextField {
            width: 350
            selectByMouse: true
            text: value
            onTextChanged: {
                trainApi.trainConfig[key]=text
                value=text
            }
        }
        Button{
            text: "..."
            onClicked: {
                file_dialog.open()
            }
        }
        Button{
            text: "打开"
            onClicked: {
                Qt.openUrlExternally("file:///"+value)
            }
        }
    }
}
