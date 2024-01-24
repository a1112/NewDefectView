import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../../Base"
import "../../../Labels"

Column{
    anchors.fill: parent
    property int textSize: 20

    Item{
        width: parent.width
        height: tt.height
        LabelBase{
        text: steelLevelCore.selectDefect.defectNo
            anchors.bottom: parent.bottom
        }


    TitleLabel{
        id:tt
        font.bold: true
        font.pixelSize:30
        text: control.getNameById(steelLevelCore.selectDefect.defectID)
            anchors.horizontalCenter: parent.horizontalCenter
        }
    LabelBase{
        font.bold: true
    text: steelLevelCore.selectDefect.defectID
    anchors.right: parent.right
    font.pixelSize: 25
    color:  control.getColorById(steelLevelCore.selectDefect.defectID)
    }

    }
    Rectangle{
    width: parent.width
    height: 2
    color:  control.getColorById(steelLevelCore.selectDefect.defectID)
    }

    TitleLabel{
        font.pixelSize: textSize
        text: "缺陷等级: "+steelLevelCore.selectDefect.grade
    }
    TitleLabel{
font.pixelSize: textSize
        text: "距头: "+steelLevelCore.selectDefect.topInImg/1000 +" m"
    }
    TitleLabel{
        font.pixelSize: textSize
        text: "距边: "+steelLevelCore.selectDefect.leftInImg/1000 +" m  "
    }
    TitleLabel{
        font.pixelSize: textSize
        text: "面积: "+steelLevelCore.selectDefect.leftInImg/1000 +" m  "
    }
    TitleLabel{
        font.pixelSize: textSize
        text: "置信度: "+steelLevelCore.selectDefect.defectCoefficient
    }


}
