import QtQuick 2.15
import Qt.labs.folderlistmodel 2.15
Item {
    id:root
    property bool defectListUrlSetting: false
    property url defectListUrl: ""
    property url tempDefectListUrl: ""
    function randomColor() {
        return "#"+(Math.random() * 0xFFFFFF << 0).toString(16)
    }
    property FolderListModel folderModel:
    FolderListModel {
        showDirs: true
        showFiles: false
        folder: defectListUrlSetting? tempDefectListUrl: defectListUrl
    }


    property SampleItemCore sampleItemCore_l: SampleItemCore{
        category: "sampleItemCore_l"
    }
    property SampleItemCore sampleItemCore_r: SampleItemCore{
        category: "sampleItemCore_r"
    }

    SampleSettings {
        id: settings
        property alias defectListUrl: root.defectListUrl
    }
}
