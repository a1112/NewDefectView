import QtQuick 2.15
import QtQuick.Controls 2.15
Item {
    property var versionInfo: {

    api.client_update(version,(text)=>{
                versionInfo=JSON.parse(text)
                      },(err)=>{})
    }
    property bool hasUpAppVersion: versionInfo["update"]
    property string version: "1.0.5"
    property string newVersion: versionInfo["version"]
    property var upMsg: versionInfo["upMsg"]

    function openUpApp(){
        upAppMenu.open()
    }
}
