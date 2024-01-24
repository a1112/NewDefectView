import QtQuick 2.15

Item {
    property bool inited: false



    function init(){
        control.initMainList()

    }

    function tryInit(){ //在定时器时调用
        if (!inited){
        inited=true
            init()
        }
    }

    function reInit(){
        init()
    }

}
