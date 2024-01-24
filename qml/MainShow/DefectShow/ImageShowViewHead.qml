import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Layouts 1.15
import "../../btns"
Item{
id:root
height: dpi*0.28
Pane{
    anchors.fill: parent
    Material.elevation: 5
}
RowLayout{
    width: parent.width
    height: parent.height
    spacing: 0.1*dpi
    Item{
        height: root.height
        width: height
        AiBtn{
        }
    }
    Item{
        Layout.fillWidth: true
        Layout.fillHeight: true
    }
    PreBtn{
        onClicked: {
            dsmItem.selectNextImage(1)
        }
    }
    NextBtn{
        onClicked: {
         dsmItem.selectNextImage(-1)
        }
    }

    Item{
        height: root.height
        width: height
        WindowModelChangeButton{}
    }
    Item{
        height: root.height*1.2
        width: height
        CloseBtn{
            onClicked: {
                if (isUpSurface){
                control.closeUpShowOtherView()
                }
                else
                    control.closeDownOtherView()
            }
        }
    }
    Item{
    height: 10
    width: dpi*0.5
    }
}

}
