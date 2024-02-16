import QtQuick 2.15

Item {

    property string ip: "127.0.0.1"
    property int port: 8000
    property string protocol: "http://"
    property string hostname: ip



    readonly property string serverUrl: protocol+hostname+":"+port
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
