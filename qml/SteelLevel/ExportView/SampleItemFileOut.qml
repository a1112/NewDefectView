import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1
import "../../SearchView"
SampleItemBase {
    id:sample_fileOut

    FileDialog{
        id:fileSelect
        onAccepted:{
            console.log("选择文件",currentFile)
            textField.text=currentFile
        }
    }

    LabelBase{
        text: "导出路径"
    }

    TextFieldBase{
        Layout.fillWidth: true
        id:textField
        text: ""
    }

    MoreButton{
        onClicked: fileSelect.open()
    }

}
