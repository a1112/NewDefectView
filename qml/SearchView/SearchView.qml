import QtQuick 2.15
import Qt.labs.platform 1.1
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls.Material 2.15
import "../btns"
//查询界面
Menu{
    id:root
    dim:true
    height: 6*dpi
    width: 7*dpi
    property string key_: ""
    Material.elevation: 10

    function myPopup(){
        root.popup()
    }
    function myClose(){
        // 关闭
        root.close()
    }
    Item{
        anchors.fill: parent
        ColumnLayout{
            spacing: 0.3*dpi
            anchors.fill: parent
            anchors.centerIn: parent
            width: parent.width-0.4*dpi
            height: parent.height-0.4*dpi
            Row{
                width: root.width
                    Label{
                        id:titleLabel
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pointSize: 20
                        font.bold: true
                        font.family: "微软雅黑"
                        text: "查询"
                        Material.foreground: Material.Purple
                    }

                CloseBtn{
                    anchors.right: parent.right
                    height: titleLabel.height
                    width: height
                    onClicked: {
                        root.close()
                    }
                }
            }
            Item{
            width: 1
            height: 0.1*dpi
            }
            TextFieldSimple{
                maximumLength:6
                placeholderText:"流水号"
                showText:"按照流水号查询"
                validator: IntValidator {bottom: 0; top: 999999;}
                onSearch: {
                    control.searchByID(key)
                    root.close()
                }
            }
            TextFieldSimple{
                placeholderText:"钢板号"
                placeholderTextColor:Material.color(Material.BlueGrey)
                showText:"按照钢板号查询"
                inputMethodHints:Qt.ImhEmailCharactersOnly
                maximumLength:30
                validator: RegularExpressionValidator{
                    regularExpression:/[0-9a-zA-Z]*/
                }
                onSearch:{
                    control.searchBySteelNo(key)
                    root.close()
                }
            }
            SearchByTime{
                onSearch:{
                    control.searchByDate(fromDate,toDate)
                    root.close()
                }
            }
        }
    }



}
