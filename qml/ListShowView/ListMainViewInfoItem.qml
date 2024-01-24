import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../Base"
Rectangle {
    id:root
    width: parent.width
    height: parent.height/3
    property color titleColor: "#34B9F3"
    property var tList: ["卷号","长度","序号"]
    property var vList: ["8092219-1-799166","15.5米", "155789"]
    RowLayout{
        anchors.fill: parent
        LabelBase{
            text:tList[0]
            color: titleColor
        }

        LabelBase{
            text:vList[0]
            color: "#fff"
            Layout.preferredWidth:0.4*root.width
        }
        LabelBase{
            text: tList[1]
            color: titleColor

        }
        LabelBase{
            text:vList[1]
            color: "#fff"
            Layout.preferredWidth:0.15*root.width

        }
        LabelBase{
            text: tList[2]
            color: titleColor
        }
        LabelBase{
            text:vList[2]
            color: "#fff"
            Layout.preferredWidth:0.2*root.width
        }
    }
}
