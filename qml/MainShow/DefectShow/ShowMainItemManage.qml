import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Item{
    Layout.fillWidth: true
    Layout.fillHeight: true
    property ListModel cameraListMiodel
    property int imageCount
    property bool isUpSurface: false
    id:root
    StackLayout{
        anchors.fill: parent
        currentIndex: !isUpSurface?
                          coreObj.defectShowViewUp.otherImageModel
                        :coreObj.defectShowViewDown.otherImageModel
        DefectShowMainItem{
            id:dsmi      //展示缺陷试图
            isUpSurface:root.isUpSurface
            Component.onCompleted: {
                if (root.isUpSurface){
                    coreObj.defectShowViewUp=this
                }else
                {coreObj.defectShowViewDown=this
            }
            }
        }
    ImageShowMainItem{//  other view
        isUpSurface:!root.isUpSurface
        id:ismi
        dsmItem:isUpSurface?coreObj.defectShowViewUp:coreObj.defectShowViewDown
    }
    }

}
