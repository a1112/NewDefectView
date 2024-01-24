import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../../Base"
import "../../../Sql/Obj"
Item {
//    visible: !sql_GradeInfo.isNull
    property int space: 10
    property int seqNo: coreState.currentSteelId
    property color gradColor: sql_GradeInfo.grade==1?"green":sql_GradeInfo.grade==2?"yellow":"red"
    property Sql_GradeInfo sql_GradeInfo: Sql_GradeInfo{}
    property var gradInfo:{return {}}

    onSeqNoChanged: {
        api.getGradeInfo(coreState.currentSteelId,(result)=>{
                             if (result){

                                 let reData = JSON.parse(result)

                                 gradInfo=reData
                                 sql_GradeInfo.init_sql(gradInfo)
                             }
                             else{

                             }

                         },
                         (errorMsg)=>{//判级判断获取失败
                             console.log(errorMsg)
                         })
    }

    Item {
        anchors.centerIn: parent
        width: parent.width-space
        height: parent.height-space

        Pane{
            anchors.fill: parent
            Material.elevation: 12
        }
        ColumnLayout{
                        anchors.fill: parent
                Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
                ScrollView {

                    clip: true
                    id: view
                    anchors.fill: parent
                    TextArea {
                         width: view.width
                        selectByMouse: true
                        selectByKeyboard: true
                        wrapMode:TextEdit.WordWrap

                                                   font.bold: true
                                                    font.pixelSize: 20
                        text:
                            "上表面：\n"+sql_GradeInfo.dscTop+
                            "\n下表面：\n"+sql_GradeInfo.dscBot
                    }
                }

                }

                Item{
                    height: 30
                    Layout.fillWidth: true
                    anchors.bottom: parent.bottom
                RowLayout{
                    anchors.verticalCenter: parent.verticalCenter
                    width: parent.width
                    LabelBase{
                        text: sql_GradeInfo.grade
                    }
                    Item{
                    Layout.fillWidth: true
                    height: 1
                    }
                    LabelBase{
                        text: sql_GradeInfo.quality
                                      font.pixelSize: 35
                        background: Rectangle{
                        color: "#000"
                        }
                        color: gradColor
                    }
                    Item{
                    Layout.fillWidth: true
                    height: 1
                    }
                    LabelBase{
                        text: sql_GradeInfo.steelUse
                        font.pixelSize: 30
                        font.bold: true
                        background: Rectangle{
                        color: "#000"
                        }
                    }
                    Item{
                    width: 5
                    height: 1
                    }
                }

                }

        }
    }
    Rectangle{
        anchors.fill: parent
        color: "#00000000"
        border.width: 1
        border.color: gradColor
    }
}
