
import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15
ApplicationWindow{
    visible: false
    width: 400
    height: 300
    title: "API测试工具"
    property int apiTestMenuIndex: 0
    SplitView{
        anchors.fill: parent
        orientation: Qt.Horizontal
    ListView{
        SplitView.preferredWidth: 150
        SplitView.fillHeight: true
        model: ListModel{
            ListElement{
                titleName:"钢板号列表测试"
            }
            ListElement{
                titleName:"控制测试"
            }
            ListElement{
                titleName:"缺陷测试"
            }
            ListElement{
                titleName:"报警测试"
            }
            ListElement{
                titleName:"查询测试"
            }
        }
        delegate: ItemDelegate{
            width: parent.width
            text: titleName
            highlighted:apiTestMenuIndex===index
            onClicked: {
                apiTestMenuIndex=index
            }
        }
    }

    StackLayout{
    SplitView.fillHeight: true
    SplitView.fillWidth: true
    currentIndex:apiTestMenuIndex
    SteelNoTestView{
    }
    }


    }
}
