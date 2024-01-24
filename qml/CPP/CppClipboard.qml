import QtQuick 2.15
import Clipboard 1.0
Item {
    Clipboard{  // 在 C++中实现， 操作剪切板
            id:clipboard
        }

    function setText(text){
        return clipboard.setText(text)
    }
}
