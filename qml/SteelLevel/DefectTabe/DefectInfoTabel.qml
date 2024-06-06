import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Item{


    ListView {
        anchors.fill: parent
        id: listView
        model:defectInfoModel
        delegate:
            DefectInfoItem{
        }
    }
}

