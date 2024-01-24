import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
Item {
    Action{//F11 全屏
        shortcut: StandardKey.FullScreen
        onTriggered:
            id_app.visibility=id_app.visibility===Window.FullScreen?Window.Maximized:Window.FullScreen
    }
    Action{// Ctrl + C  复制
        shortcut: StandardKey.Copy
        onTriggered: {
            //  将图像复制到剪切板
        }
    }
    Action{
        shortcut: StandardKey.Save
        onTriggered: {

        }

    }
}
