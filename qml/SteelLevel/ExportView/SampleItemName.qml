import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
SampleItemBase {
    LabelBase{
        text: "导出名称："
    }
    TextFieldBase{
        id:textField
        Layout.fillWidth: true
        text: ""
    }
    Item{
    width: 50
    height: 1
    }
}
