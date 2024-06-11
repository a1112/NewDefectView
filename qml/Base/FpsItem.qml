import QtQuick 2.0
import QtQuick.Window 2.2

Item {
    id: root
    property int frameCounter: 0
    property int frameCounterAvg: 0
    property int counter: 0
    property int fps: 0
    property int fpsAvg: 0
    y:height
    readonly property real dp: Screen.pixelDensity * 25.4/160


    width:  10*dp;
    height: 10*dp;

    Image {
        id: spinnerImage
        anchors.verticalCenter: parent.verticalCenter
        x: 5 * dp
        width: 36 * dp
        height: width
        NumberAnimation on rotation {
            from:0
            to: 360
            duration: 800
            loops: Animation.Infinite
        }
        onRotationChanged: frameCounter++;
    }

    Text {
        anchors.left: spinnerImage.right
        anchors.leftMargin: 8 * dp
        anchors.verticalCenter: spinnerImage.verticalCenter
        color: "#c0c0c0"
        font.pixelSize: 30 * dp
        text:""+ root.fps + " fps"
        font.bold: true
    }

    Timer {
        interval: 2000
        repeat: true
        running: true
        onTriggered: {
            frameCounterAvg += frameCounter;
            root.fps = frameCounter/2;
            counter++;
            frameCounter = 0;
            if (counter >= 3) {
                root.fpsAvg = frameCounterAvg/(2*counter)
                frameCounterAvg = 0;
                counter = 0;
            }
        }
    }
}
