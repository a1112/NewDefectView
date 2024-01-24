import QtQuick 2.15

Item {

    Timer{  //  获取延时
        interval: 300
        id:toEnd
        onTriggered: {
            coreObj.mainListView.positionViewAtEnd()
        }
    }

    function getLastId(){
        if (coreModels.mainListModel.count<1){
            return -1
        }
        return coreModels.mainListModel.get(coreModels.mainListModel.count-1).steelID
    }
    function appendRealSteel(data){
        // 添加数据
        let color = coreModels.getColorBySteelNo(data.steelNo)
        data["t_color"]=color
        if (getLastId()!==data.steelID)
            coreModels.realListModel.append(data)
        //        toEnd.restart()
        return;
    }
    function appendSearchSteel(data){
        let color = coreModels.getColorBySteelNo(data.steelNo)
        data["t_color"]=color
        coreModels.searchListModel.append(data)
    }
    function _selectLastModelItem(){
            while (coreModels.mainListModel.count>coreConfig.maxListCount){
                // 超过，移除N
                coreModels.mainListModel.remove(0)
            }
            coreState.currentSteelIndex=0
        coreState.currentSteelIndex=coreModels.mainListModel.count-1
    }
    function selectLastModelItem(){
        if(coreState.realAutoType){
            _selectLastModelItem()
        }
    }

    function flushID(){
        //刷新最新的 n 条记录的信息
        api.getSteelByNum(10,(result)=>{
                              let reData=JSON.parse(result)
                              let dictList={}
                              for (let i=0;i<reData.length;i++){
                                  dictList[reData[i].defectID] =  reData[i]
                              }
                              for (let i2 = 0;i2<10;i2++)
                              {
                                  let index=coreModels.mainListModel.count-1-i2
                                  let value = coreModels.mainListModel.get(index)
                                  if (value.defectID in dictList[defectID]){
                                    coreModels.mainListModel.set(index,dictList[defectID])
                                  }
                              }
                          },
                          (errorMsg)=>{
                              //                                     globalDialog.openErrorMsgDialog("列表单条数据请求失败！  "+errorMsg)
                          })

    }
    function initMainListByNum(num){
        // 初始化数据 num 条
        return api.getSteelByNum(num,(result)=>{
                                     coreModels.mainListModel.clear()

                                     let reData=JSON.parse(result)
                                     for (let i=0;i<reData.length;i++){
                                         appendRealSteel(reData[i])
                                     }
                                     _selectLastModelItem()
                                 },
                                 (errorMsg)=>{
                                     //                                     globalDialog.openErrorMsgDialog("列表初始化请求失败！  "+errorMsg)
                                 })
    }
    function initMainList(){
        initDefectDict()                                        // 初始化缺陷字典
        _selectLastModelItem()
        return initMainListByNum(coreConfig.initMainListNum)    // 初始化列表

    }
    function randomAppendRealSteel(){    // 随机添加一条数据
        return api.getSteelByNum(1,(result)=>{
                                     let reData=JSON.parse(result)
                                     for (let i=0;i<reData.length;i++){
                                         appendRealSteel(reData[i])
                                     }
                                     selectLastModelItem()
                                 },
                                 (errorMsg)=>{
                                     //                                     globalDialog.openErrorMsgDialog("列表单条数据请求失败！  "+errorMsg)
                                 })
    }


    function refreshDefectViewBySteelId(steelId){
        //  刷新视图
        return api.getDefectViewBySteelId(steelId,(result)=>{
                                              let reData=JSON.parse(result)
                                              coreModels.defectListModelDict={}
                                              coreModels.currentDefectItemModel.clear()
                                              coreModels.defectListModel.clear()
                                              // updata 宽度轮廓数据
                                              coreObj.upDefcts=reData["up"]
                                              coreObj.downDefects=reData["down"]
                                              if(appGlobal.appType==1){
                                                  coreObj.defectShowViewUp.refreshView(reData["up"])
                                                  coreObj.defectShowViewDown.refreshView(reData["down"])
                                              }},
                                          (errorMsg)=>{
                                              //globalDialog.openMsgFialog("缺陷视图初始化失败！  "+steelId+" "+errorMsg)
                                          })


    }
    function refreshUserDefectViewBySteelId(steelId){
        return api.getUserDefectViewBySteelId(steelId,(result)=>{
                                              let reData=JSON.parse(result)

                                                  coreObj.upUserDefcts=reData["up"]
                                                  coreObj.downUserDefects=reData["down"]
                                            },
                                          (errorMsg)=>{

                                              //globalDialog.openMsgFialog("缺陷视图初始化失败！  "+steelId+" "+errorMsg)
                                          })

    }

    function initDefectDict(){  // 初始化缺陷字典
        return api.getDefectDict((result)=>{
                                     coreModels.mainListModel.clear()
                                     coreModels.defectDictModel.clear()
                                     let reData=JSON.parse(result)
                                     let defectDict={}
                                     for (var key in reData) {
                                         defectDict[key]=reData[key]
                                         coreModels.defectDictModel.append(reData[key])
                                     }
                                     coreModels.defectDict=defectDict
                                     //                                     for (let i=0;i<reData.length;i++){
                                     //                                         appendRealSteel(reData[i])
                                     //                                         //                                         selectLastModelItem()
                                     //                                     }
                                 },
                                 (errorMsg)=>{
                                     // globalDialog.openErrorMsgDialog("列表初始化请求失败！  "+errorMsg)
                                 })
    }

    function getColorById(defectId){
        if (""+defectId in coreModels.defectDict)
            return coreModels.defectDict[""+defectId].color
        return "black"
    }
    function getNameById(defectId){
        if (""+defectId in coreModels.defectDict)
            return coreModels.defectDict[""+defectId].name
        return "未定义的"
    }

    function defectAllIn(){
        // defect all chioce 全部选择
        for (let key in coreModels.defectShowDict){
            coreModels.defectShowDict[key]=true
        }
        let defectShowDict_temp=coreModels.defectShowDict
        coreModels.defectShowDict={}
        coreModels.defectShowDict=defectShowDict_temp
    }
    function defectAllOut(){
        // defect all chioce 全部选择
        for (let key in coreModels.defectDict){
            coreModels.defectShowDict[key]=false
        }
        let defectShowDict_temp=coreModels.defectShowDict
        coreModels.defectShowDict={}
        coreModels.defectShowDict=defectShowDict_temp
    }

    function getAppFlush(currentID,maxID){
        // 获取 刷新数据, 根据当前 seqNo,maxSeqNo 获取最新状态
        return api.getAppFlush(currentID,maxID,(result)=>{
                                   let reData = JSON.parse(result)
                                   if (reData["appendSteel"]){
                                       for (let itemIndex in reData["appendSteel"]){
                                           let appendSteelOne =reData["appendSteel"][itemIndex]
                                           appendRealSteel(appendSteelOne)
                                           coreState.lastSteelObj=appendSteelOne
                                           selectLastModelItem()
                                           flushID()
                                       }

                                   }
                               },
                               (errorMsg)=>{
                                   console.log(errorMsg)
                                   //                                     globalDialog.openErrorMsgDialog("列表初始化请求失败！  "+errorMsg)
                               })
    }

    function getWidthFlush(steelId){
        return api.getWidths(steelId,(result)=>{
                                 let reData = JSON.parse(result)
                                 coreState.upImageWidthInfoList=reData[0]
                                 coreState.downImageWidthInfoList=reData[1]
                             },
                             (errorMsg)=>{
                                 console.log(errorMsg)
                                 //                                     globalDialog.openErrorMsgDialog("列表初始化请求失败！  "+errorMsg)
                             })

    }

    function getRealInfoById(steelId){
        return api.getRealInfoById(steelId,(result)=>{

                                       let reData = JSON.parse(result)
                                       if (reData){
                                           coreModels.realListModel.set(coreModels.realListModel.count-1,reData["lastObj"])
                                           CoreState.lastSteelObj=reData["lastObj"]
                                           if(coreState.lastSteelObj.steelID===coreState.currentSteelId
                                              &&appGlobal.appType==1
                                              ){
                                               coreObj.defectShowViewUp.refreshView(reData["data"]["up"])
                                               coreObj.defectShowViewUp.refreshView(reData["data"]["down"])
                                           }
                                       }
                                   },
                                   (errorMsg)=>{
                                       console.log(errorMsg)
                                       //                                     globalDialog.openErrorMsgDialog("列表初始化请求失败！  "+errorMsg)
                                   })
    }

    function searchByID(steelId){
        return api.searchByID(steelId,(result)=>{
                                  let reData = JSON.parse(result)
                                  if (!reData.length){
                                      globalDialog.openMsgFialog("查询失败！ "+steelId)
                                  }
                                  else{

                                      coreModels.searchListModel.clear()
                                      coreModels.listViewType=coreModels.searchViewType
                                      for (let i=0;i<reData.length;i++){
                                          appendSearchSteel(reData[i])
                                      }
                                      _selectLastModelItem()
                                  }
                              },
                              (errorMsg)=>{
                                  console.log(errorMsg)
                                  //                                     globalDialog.openErrorMsgDialog("列表初始化请求失败！  "+errorMsg)
                              })
    }
    function searchBySteelNo(steelNo){
        return api.searchBySteelNo(steelNo,(result)=>{
                                       let reData = JSON.parse(result)
                                       if (!reData.length){
                                           globalDialog.openMsgFialog("查询失败！"+steelNo+"未查询到结果")
                                       }
                                       else{
                                           coreModels.searchListModel.clear()
                                           coreModels.listViewType=coreModels.searchViewType
                                           for (let i=0;i<reData.length;i++){
                                               appendSearchSteel(reData[i])
                                           }
                                           _selectLastModelItem()
                                       }
                                   },
                                   (errorMsg)=>{
                                       console.log(errorMsg)
                                       //                                     globalDialog.openErrorMsgDialog("列表初始化请求失败！  "+errorMsg)
                                   })
    }

    function closeShowOtherView(){  // 關閉视图
        closeUpShowOtherView()
        closeDownOtherView()

    }
    function closeUpShowOtherView(){
        coreObj.defectShowViewUp.otherImageModel=0
    }
    function closeDownOtherView(){
        coreObj.defectShowViewDown.otherImageModel=0
    }

    function searchByDate(startDate,endDate){
        let args={
            filtertList:""
        }
        if(coreState.searchByDefectEnable){
            let filter=[]
            for(let key in coreState.searchDefectDict){
                if (coreState.searchDefectDict[key])
                    filter.push(key)
            }
            args.filtertList=filter.join(",")
        }
        return api.searchByDate(startDate,endDate,args,(result)=>{
                                    let reData = JSON.parse(result)
                                    if (!reData.length){
                                        globalDialog.openMsgFialog("查询失败！未查询到结果")
                                    }
                                    else{
                                        coreModels.searchListModel.clear()
                                        coreModels.listViewType=coreModels.searchViewType
                                        for (let i=0;i<reData.length;i++){
                                            appendSearchSteel(reData[i])
                                        }
                                        _selectLastModelItem()
                                    }
                                },
                                (errorMsg)=>{
                                    console.log(errorMsg)
                                    //                                     globalDialog.openErrorMsgDialog("列表初始化请求失败！  "+errorMsg)
                                })
    }

    function changeToPreSteel(){
        coreState.currentSteelIndex-=1
    }
    function changeToNextSteel(){
        coreState.currentSteelIndex+=1
    }

    function getWidths(steelId){
        return api.getWidths(steelId,(result)=>{
                                 let reData = JSON.parse(result)
                                 coreState.upImageWidthInfoList=reData[0]
                                 coreState.downImageWidthInfoList=reData[1]
                             },
                             (errorMsg)=>{
                                 console.log(errorMsg)
                             }
                             )

    }
}
