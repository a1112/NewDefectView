import QtQuick 2.0

Column {
    DefectNavigationViewitem{
        title: "上表面"
        steelDetectionModel:coreObj.defectShowViewUp.steelDetectionModel  //coreModels.upSteelDetectionModel

    Component.onCompleted: {
        coreObj.defectNavigationViewitemUp=this
    }
    }
    RecBase{
    width: parent.width
    height: 0.1*dpi
    }
    DefectNavigationViewitem{
        title: "下表面"
        steelDetectionModel:coreObj.defectShowViewDown.steelDetectionModel//coreModels.downSteelDetectionModel

        Component.onCompleted: {
            coreObj.defectNavigationViewitemDown=this
        }
    }
}
