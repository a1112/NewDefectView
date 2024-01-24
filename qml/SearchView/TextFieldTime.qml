import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15

RowLayout{

    property alias placeholderText: lab.text
    property alias text: cb.currentText
    property alias model: cb.model
    property alias currentIndex: cb.currentIndex

    ComboBox {
        Layout.fillWidth: true
        id:cb
//        displayText:""
    }
    LabelBase{
        id:lab
    }
}

