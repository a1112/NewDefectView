import QtQuick 2.15

ImageToolItemBase{
    id:root
    property int layoutKey:-1

    checked: layoutKey===imageViewCore.layoutType
    onClicked: {
        imageViewCore.layoutType=
                layoutKey===imageViewCore.layoutType?
                  imageViewCore.layoutOld:layoutKey
    }

}
