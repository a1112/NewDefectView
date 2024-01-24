import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
Flow {
    Layout.fillWidth: true
    height: contentHeight

    Repeater{
        model:coreModels.defectDictModel
        delegate: CheckDelegate{
            text: name
            Material.accent:color
            checked: coreState.searchDefectDict[id]??false
            onCheckedChanged: coreState.searchDefectDict[id]=checked
        }
    }
}
