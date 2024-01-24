import QtQuick 2.15

import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import "../Labels"
Menu {
    width: col.width

    Column{
        id:col
        Row{
            spacing: 10
            LabelFootInfoValue{
            text: qsTr("亮度  ")
            }
        SpinBox{
            from: -50
            value: imageCore.brightness   //亮度
            onValueChanged:imageCore.brightness=value
            to:50
            stepSize: 1
        }
        }
        Row{
            LabelFootInfoValue{
            text: qsTr("对比度")
            }
        SpinBox{
            from: -50
            value: imageCore.contrast   //对比度
             onValueChanged:imageCore.contrast=value
            to:50
            stepSize:1
        }
        }
    }
}
