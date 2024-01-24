import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
Column {
LabelBase{
text:up?"上表":"下表"
color:up?Material.color(Material.Green):Material.color(Material.Blue)
}
//LabelBase{
//text: defectIndex
//}
}
