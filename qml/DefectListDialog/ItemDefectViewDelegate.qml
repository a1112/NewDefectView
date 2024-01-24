import QtQuick 2.15

Item {
    width:image.width
    height: list.height
    Image {
        id: image
        source: api.getImage(cameraId,defectNo)
        fillMode: Image.PreserveAspectFit
        height: parent.height
    }
    MouseArea{
        anchors.fill: parent
        onClicked: {//选中
            if (up){
                coreObj.defectShowViewUp.setChiceByIndex(defectIndex)
            }
            else{
                coreObj.defectShowViewDown.setChiceByIndex(defectIndex)
            }
        }

        onDoubleClicked: {// 详细查看
        }
    }
    InfoView{
    }
}
