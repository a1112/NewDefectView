import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
Item {

    height: 500
    id:levelTabel
    property int currentDefectIndex: 0

RowLayout{
anchors.fill: parent

TabelList{
    model: coreModels.defectTabelModel
    width: 220
    Layout.fillHeight: true
    height: levelTabel.height
}

TabelView{
    model: coreModels.defectTabelModel
    Layout.fillWidth: true
    Layout.fillHeight: true
        height: levelTabel.height
}


}
}
