import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Dialog {
    id:root

    width: 500
    height: 400
    anchors.centerIn: parent
    property url image_source: ''
    function updata(data){
        //更新弹窗
        image_source=api.getImage(data.cameraId,data.defectNo)
        root.open()
    }
    RowLayout{
        anchors.fill: parent
        FlickableImageView{
        Layout.fillWidth: true
        Layout.fillHeight: true
        }
    }
    enter: Transition {
            NumberAnimation { property: "opacity"; from: 0.0; to: 1.0 ;duration:400}
        }
    exit: Transition {
             NumberAnimation { property: "opacity"; from: 1.0; to: 0.0;duration:400 }
         }
}
