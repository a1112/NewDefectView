import QtQuick 2.15
import QtQuick.Controls 2.15
ItemDelegateButtonBase {
    source: "qrc:///qml/resource/icon/AI.png"

    Menu{

        id:aiMenu

        MenuItem{
            text: qsTr("重算")
            onClicked: {
                //   图像重算
                console.log("图像重算")
                control.refreshDefectViewBySteelId_predict(coreState.currentSteelId)
            }
        }

        MenuItem{
            text: qsTr("设置...")
        }
    }

    onClicked: {
        aiMenu.popup()
    }
}
