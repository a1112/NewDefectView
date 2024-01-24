import QtQuick 2.0
import QtQuick.Controls 2.15
import "../Base"
ItemDelegate{
    height: parent.height*0.7
    width: height
    signal rclicked()
    y:parent.height*0.15
    EffectImage{
        source: "qrc:///qml/resource/icon/more.png"
        anchors.centerIn: parent
        width: parent.width*0.8
        height: parent.height
        fillMode: Image.PreserveAspectFit
    }
    MouseArea{
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        onClicked: rclicked()
    }
}
