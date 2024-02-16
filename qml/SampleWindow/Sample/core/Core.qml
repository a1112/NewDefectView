import QtQuick 2.15
import Qt.labs.folderlistmodel 2.15
Item {

    property FolderListModel folder:
    FolderListModel{
        nameFilters: ["*.*"]
        folder: "file:///E:\\clfData\\data\\凹坑"
    }
}
