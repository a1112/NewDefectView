import QtQuick 2.15
import Qt.labs.folderlistmodel 2.15
import Qt.labs.settings 1.1
Item {
    id:root
    property FolderListModel folderModel
    property string currentDefectName
    property string folderSource
    property alias category: sett.category

    property var selectFiles: {return {}}

    Settings {
            id: sett
            fileName: "config.ini"
            property alias folderSource: root.folderSource
            property alias currentDefectName: root.currentDefectName
    }

    function getUrls() {
        var urls = ""
        for (var i in selectFiles) {
            let url=selectFiles[i]
            if (urls)
                if (urls){
                    urls+="\n"+url} else{}
                else
                    urls=url

        }
        selectFiles={}
        return urls
    }

}
