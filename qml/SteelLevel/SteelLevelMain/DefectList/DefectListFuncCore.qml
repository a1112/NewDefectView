import QtQuick 2.15
/*
对于 一些事件的处理
仅仅单个
*/
Item {

    property var shrinkDefectListFunc

    property bool itemViewHasVis: true

    function shrinkDefectList(){
        shrinkDefectListFunc()
    }
}
