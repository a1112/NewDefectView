import QtQuick 2.15
import "../../../Labels"
Column {
    LabelTitle{
        text: control.getNameById(selectDefectObj.defectID)
        color:"red"
    }
}
