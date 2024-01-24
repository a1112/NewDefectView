import QtQuick 2.15

Item {
    function appendSelectItem(key,obj){
        // 增加选中的缺陷
        defectViewState.selectList[key]=obj
        defectViewState.addSeleceCountData(obj)

    }

    function delectSelectItem(key){
        // 去除选中的缺陷
        defectViewState.delSeleceCountData(defectViewState.selectList[key])
        delete defectViewState.selectList[key]
    }

}
