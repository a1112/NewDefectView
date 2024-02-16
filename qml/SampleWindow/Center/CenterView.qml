import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../Sql/Obj"

ListView{
    id:root
        model: sampleCore.folderModel
        height: parent.height
    delegate:  DefectItemList{
    width:root.width
    height: autoSize.itemTabHeight
    }
}

