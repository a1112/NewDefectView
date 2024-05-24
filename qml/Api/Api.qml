import QtQuick 2.15

Item {
    function url(serverUrl, ...args){
        let reUrl=serverUrl
        for(let argIndex in args){
            reUrl+="/"+args[argIndex]
        }
        return reUrl
    }

    property ApiConfig apiConfig: ApiConfig{}
    function getSteelByNum(num,success,failure){    //  获取 n 条数据集
        ajax.get(apiConfig.url("steelGet",num,coreState.defectOnly+0),success,failure)
    }

    function _getServerDelayed_(serverUrl,success,failure){//内部调用
        return ajax.get(url(serverUrl,"getDelayed"),success,failure)
    }
    function getServerDelayed(success,failure){     // 空调用，获取延时
         return _getServerDelayed_(apiConfig.serverUrl,success,failure)
    }
    function getDefectViewBySteelId(steelId,success,failure){   //  获取缺陷的刷新
        return ajax.get(apiConfig.url("getDefectView",steelId),success,failure)
    }

    function getDefectViewBySteelId_predict(steelId,success,failure){
        return ajax.get(apiConfig.url("getDefectView_predict",steelId),success,failure)
    }

    function getUserDefectViewBySteelId(steelId,success,failure){   //  获取用户标注的缺陷
        return ajax.get(apiConfig.url("getUserDefectView",steelId),success,failure)
    }
    function addUserDefectView(defectInfo,success,failure){
        return ajax.get(apiConfig.url("addUserDefectView",defectInfo),success,failure)
    }

    function getDefectDict(success,failure){
        return ajax.get(apiConfig.url("DefectDict"),success,failure)
    }
    function getImage(cameraIndex,defectId,success,failure){//获取缺陷图像
        /*
            准备废弃
        */
        return apiConfig.url("image",cameraIndex,defectId)
        //return ajax.get(apiConfig.url("getImage",imageId),success,failure)
    }
    function getMaxImage(cameraIndex,seqNo,imageIndex,success,failure){
        return apiConfig.url("maxImage",cameraIndex,seqNo,imageIndex)
    }
    function getAppFlush(currentSeqNo,maxSeqNo,success,failure){// 获取刷新状态
        return ajax.get(apiConfig.url("getAppFlush",currentSeqNo,maxSeqNo),success,failure)
    }

    function getRealInfoById(steelId,success,failure){ //获取实时刷新数据
        return ajax.get(apiConfig.url("getRealInfoById",steelId),success,failure)
    }

    function searchByID(steelId,success,failure){ //查询数据
        return ajax.get(apiConfig.url("searchByID",steelId),success,failure)
    }
    function searchBySteelNo(steelNo,success,failure){     // 通过 钢板号 查询
        return ajax.get(apiConfig.url("searchBySteelNo",steelNo),success,failure)
    }

    function searchBySteelParentNo(steelNo,success,failure){     // 通过 板坯号 查询
        return ajax.get(apiConfig.url("searchBySteelParentNo",steelNo),success,failure)
    }

    function searchByDate(startTime,endTime,args,success,failure){
        return ajax.get(apiConfig.url("searchByDate",startTime.format("yyyy-MM-dd hh:mm:ss"),
                                       endTime.format("yyyy-MM-dd hh:mm:ss"),args),success,failure)
    }
    // ------------- cimg -----------------

    function getCimg(cameraIndex,seqNo,imageIndex,resize){
        return apiConfig.url("cimg",cameraIndex,seqNo,imageIndex,resize)
    }

    function getWidths(steelId,success,failure){
        return ajax.get(apiConfig.url("widths",steelId),success,failure)
    }
    function getDoc(){
        return apiConfig.url("docs")
    }
    function restartServer(success,failure){
        return ajax.get(apiConfig.url("restartServer"),success,failure)
    }
    function getGradeInfo(seqNo,success,failure){
        return ajax.get(apiConfig.url("getGradeInfo",seqNo),success,failure)
    }

    //------------------version---------------------
    function client_update(version,success,failure){
        return ajax.get(apiConfig.url("client_update",version),success,failure)
    }

    function getUpdateUrl()
    {
        return "cmd /k update.exe ip="+apiConfig.hostname+" port="+apiConfig.port
    }

    function getSharedFolder(url_,success,failure){
        return ajax.get(apiConfig.url("getSharedFolder",url_),success,failure)

    }


    function getSteelLevelInfo(success,failure){
        return ajax.get(apiConfig.url("steelLevel/info"),success,failure)
    }
    function toTimeString(timeItem){
        return timeItem.getFullYear()+"-"+timeItem.getMonth()+"-"+timeItem.getDay()+" "+timeItem.getHours()+":"+timeItem.getMinutes()+":"+timeItem.getSeconds()

    }
    function exportSteelLevelByTime(startTime,endTime,fileName,success,failure){
        return ajax.get(apiConfig.url("steelLevel/exportSteelLevelByTime",startTime.format("yyyy-MM-dd hh:mm:ss"),endTime.format("yyyy-MM-dd hh:mm:ss"),fileName),success,failure)


    }
}
