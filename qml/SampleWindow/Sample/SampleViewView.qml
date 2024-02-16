import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import Qt.labs.folderlistmodel 2.15

import "../Core"

// 样本管理
Item {
    id:root
    property int cellWidth: 150
    property int cellHeight: cellWidth

    property string folderSource: sampleItemCore.folderSource
    readonly property string currentUrl: folderSource + "/" + sampleItemCore.currentDefectName

    property FolderListModel folderListModel
    property SampleItemCore sampleItemCore: SampleItemCore{}
    onFolderSourceChanged: {
        sampleItemCore.folderSource = folderSource
    }


    property int viewIndex: 0
    ColumnLayout{
        anchors.fill: parent
        HeadView{
        }
        ImageShowDraw{
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
    function isFolder(url) {
        return url.lastIndexOf(".") === -1;
    }

    DropArea{
        // 设置 工作区域
        id:dropArea
        anchors.fill: parent
        onEntered: (drop)=>{
                       if (drop.hasUrls) {
                       }
                   }
        onExited: (drop)=>{
                  }
        onDropped: (drop)=>{
               if (drop.hasText) {
                   console.log("dropped text:", drop.text)
               }
               if (drop.hasUrls) {
                   if (isFolder(drop.urls[0].toString())) {
                       folderSource = drop.urls[0].toString()
                   } else {
                    // 移动文件
                    for (var i = 0; i < drop.urls.length; i++) {
                        var url = drop.urls[i].toString()
                        cppFuncs.os.moveFile(url, currentUrl + "/" + url.substring(url.lastIndexOf("/") + 1))
                    }
               }
           }
    }
    }
}
