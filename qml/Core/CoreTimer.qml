import QtQuick 2.14

Item {
    property CoreTimerConfig coreTimerConfig: CoreTimerConfig{}
    property bool errorDialogOpend: false
    Timer{
        id:getServerDelayed
        interval: coreTimerConfig.serverDelayedInterval
        running: true
        property int dialogCount: 0
        onTriggered: {
            let sT = new Date().valueOf()
            api.getServerDelayed((result)=>{
                                     let eT = new Date().valueOf()
                                     let delTime=eT-sT
                                     api.apiConfig.serverDelayed=delTime
                                     if (errorDialogOpend){
                                         errorDialogOpend=false
                                        globalDialog.closeMsgFialog()
                                         coreInit.reInit()
                                     }
                                     coreInit.tryInit()
                                     dialogCount=0
                                     getServerDelayed.start()
                                 },
                                 (msg)=>{
                                     let eT = new Date().valueOf()
                                     let delTime=eT-sT
                                     api.apiConfig.serverDelayed=delTime
                                     if(dialogCount==0){
                                     globalDialog.openMsgFialog("服务器访问错误 "+msg)
                                        dialogCount=50
                                     }
                                     else
                                        dialogCount--
                                     errorDialogOpend=true
                                     getServerDelayed.start()
                                 })

        }
    }


}
