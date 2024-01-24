import QtQuick 2.15
import QtQuick.Dialogs 1.3
 import QtQuick.Controls 2.15
Item {
//    Dialog{
//        id:msg_d
////        text: "提交缺陷!"
////        flags :Qt.ApplicationModal
////        informativeText:"是否 提交缺陷！！"
////        buttons:MessageDialog.Save | MessageDialog.Cancel
//        onAccepted:{

//        }
//    }
    function openAceeptDialog(){
            openAceeptDialogDialog.accept(acceptDefects
                )

    }



    function acceptDefects(){

        let i=0
        for (i=0;i<defctsUserModel.count;i++){
            let i_data = defctsUserModel.get(i)

            let repData="["+coreState.currentSteelId+","+i_data.boxX+","+i_data.boxY+","+i_data.boxW+","+i_data.boxH+
                ","+i_data.defectID+","+isTop+"]"
            console.log(repData)
            api.addUserDefectView(
                        repData
                        )
        }
        defctsUserModel.clear()

    }
}
