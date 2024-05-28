import QtQuick 2.15
import Qt.labs.settings 1.1
import "../Base"
Item {
    id:root

    property var hostList: coreModels.allHostListModels//coreModels.hostListModels
    property int hostIndex: coreModels.hostIndex
    property string protocol: hostList[hostIndex].protocol
    property string hostname: hostList[hostIndex].hostname
    property string msg: hostList[hostIndex].msg
    property int port: hostList[hostIndex].port


    readonly property string serverUrl: protocol+hostname+":"+port
    onServerUrlChanged: {
     control.initMainList()
    }
    property int serverDelayed: 30
    function url(...args){
        let reUrl=serverUrl
        for(let argIndex in args){
            if (typeof(args[argIndex])=='object')
            {
                reUrl+=getGetArgs(args[argIndex])
            }
            else
            reUrl+="/"+args[argIndex]
        }
        return reUrl
    }
    function getPostArgs(dictData){
        let res=""
        for(let key in dictData){
            if(res){
                res+="&"
            }
            res+=key+"="+dictData[key]
        }
        return res
    }
    function getGetArgs(dictData){
        let res=""
        for(let key in dictData){
            if(res){
                res+="&"
            }
            else{
            res+="?"
            }
            res+=key+"="+dictData[key]
        }
        return res
    }

}
