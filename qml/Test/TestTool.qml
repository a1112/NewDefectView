
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
ApplicationWindow{
    visible: core.testCanView
    width: 400
    height: 300
    Flow{
        width: parent.width
        height: parent.height
        spacing: 5
        Button{
            text: "添加一条数据"
            onClicked: {
                SQLBase.test_addSteel()
            }
        }
        Button{
            text: "随机修改最后数据的长度"
            onClicked: {
                SQLBase.setTopLen()
            }
        }

        Button{
            text: "增加一条钢号数据"
            onClicked: {
                SQLBase.test_addSteelId()
            }
        }
        Button{
            text: "增加一条无效数据"
            onClicked: SQLBase.test_addSteelShort()
        }
        Button{
            text: "增加一条有效数据"
            onClicked: SQLBase.test_addSteelLong()
        }

    }
}
