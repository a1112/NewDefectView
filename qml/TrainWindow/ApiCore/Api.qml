import QtQuick 2.15

import "../../Api"
Item {

    property var trainListModels: []
    property var frameList: []
    property string currentFrame: ""
    property var trainConfig: {
        return {}
    }

    property string trainConfigFilePath: ""
    onTrainConfigFilePathChanged: {
//        get_lexer_by_file(trainConfigFilePath,(result)=>{
//            lexer_text=result
//        },(error)=>{
//            lexer_text=error
//        })
        lexer_image=serverAdd.url("get_lexer_by_file",trainConfigFilePath)
    }


    property var lexer_image


    function getTrainData(){
        trainConfig["frame"]=currentFrame
        return trainConfig
    }

    property int connectState: -1

    property ServerAdd serverAdd: ServerAdd {
    }

    Timer{
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            connect()
        }
    }

    function connect(){
        getTrainConfigRoot((result)=>{
                               let reData=JSON.parse(result)
                               trainListModels=reData["trainRootList"]
                                frameList = reData["frameList"]
                               connectState=1
                           },(error)=>{
                               connectState=-1})
    }

    // 获取 训练配置数据
    function getTrainConfigRoot(success, failure){
        return ajax.get(serverAdd.url("trainConfigRoot"),success, failure)
    }

    function getTrainConfig(frame, success, failure){
        return ajax.get(serverAdd.url("trainConfig",frame),success, failure)
    }

    function train(success, failure){
        return ajax.postJson(serverAdd.url("train"),getTrainData(),success, failure)
    }

    function get_lexer_by_file(file,success, failure){
        return ajax.get(serverAdd.url("get_lexer_by_file",file),success, failure)
    }
}
