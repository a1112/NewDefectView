import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "../../btns"
import "../../Labels"
Item{
    property string l_folder_url: sampleCore.sampleItemCore_l.folderSource+"/"+fileName
    property string r_folder_url: sampleCore.sampleItemCore_r.folderSource+"/"+fileName
    property color defectColor: color
    property color sampleColor: sampleCore.randomColor()
    height: autoSize.itemTabHeight
        DefectCountL{
            id:l_folder
            folder: l_folder_url
            showDirs: false
            showFiles: true
            nameFilters: ["*.jpg","*.png","*.bmp","*.jpeg"]
        }
        DefectCountL{
            id:r_folder
            folder: r_folder_url
            showDirs: false
            showFiles: true
            nameFilters: ["*.jpg","*.png","*.bmp","*.jpeg"]
        }
            Pane{
                width: parent.width
                height: parent.height-4
                anchors.centerIn: parent
                Material.elevation: 10
            }
            Item{
                id:rec
                anchors.fill: parent
                RowLayout{
                    spacing: 3
                    width: parent.width
                    anchors.verticalCenter: parent.verticalCenter
                    LabelBase{
                        text:l_folder.count
                        font.bold: true
                        font.family: "微软雅黑"
                        font.pixelSize: autoSize. textSize
                    }
                    Item{
                        Layout.fillWidth: true
                        height: 1
                    }
                    LabelBase{
                        text: fileName
                        font.bold: true
                        font.family: "微软雅黑"
                        font.pixelSize: autoSize.textSize
                        Rectangle{
                            anchors.bottom: parent.bottom
                            width: parent.width
                            height: 3
                            anchors.verticalCenterOffset: -5
                            color:sampleColor
                        }
                    }
                    Item{
                        Layout.fillWidth: true
                        height: 1
                    }
                    LabelBase{
                        text: r_folder.count
                        font.bold: true
                        font.family: "微软雅黑"
                        font.pixelSize: titleTextSize
                    }
                }
            }
            DropArea{
                anchors.fill: parent
                onDropped: {
                    console.log(drag)
                }
            }
        RowLayout{
        anchors.fill: parent
            ItemDelegate{
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: {
                sampleCore.sampleItemCore_l.currentDefectName = fileName
                sampleCore.sampleItemCore_l.folderModel = l_folder
            }
            Rectangle{
                width: 3
                height: parent.height
                color: sampleColor
                visible: sampleCore.sampleItemCore_l.currentDefectName === fileName
            }
        }
            ItemDelegate{
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: {
                sampleCore.sampleItemCore_r.currentDefectName = fileName
                sampleCore.sampleItemCore_r.folderModel = r_folder
            }
            Rectangle{
                visible: sampleCore.sampleItemCore_r.currentDefectName === fileName
                anchors.right: parent.right
                width: 3
                height: parent.height
                color: sampleColor
            }
        }
        }
}


