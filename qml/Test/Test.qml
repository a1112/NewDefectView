import QtQuick 2.15
import QtTest 1.2

Item {
    property bool useTest: true
    function test_getSteel() {
       api.getSteelByNum(10,(result)=>{
               console.info("========= success ========")
             console.info(result)
                         })
    }
    Component.onCompleted: {
    test_getSteel()
    }
}
