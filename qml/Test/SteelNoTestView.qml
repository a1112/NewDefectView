import QtQuick 2.15
import QtQuick.Controls 2.15
Flow {
    spacing: 10
    Button{
        text: qsTr("随机刷新100条记录")
        onClicked: {
            control.initMainListByNum(100)
        }
    }
    Button{
        text: qsTr("随机添加一天新数据")
        onClicked: {
        control.randomAppendRealSteel()

        }
    }


}
