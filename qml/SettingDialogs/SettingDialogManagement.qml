import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import QtQuick.Window 2.15
Item {





function openDefectInfoDialogs(){
            defectInfoDialog.myPopup()
}
function openConnectDialogs(){
            connectDialogs.myPopup()
}
function openSearchDialog(){
            searchView.myPopup()
}
function    openDefectListDialogView(defectDatas){
        defectListDialogView.myPopup(defectDatas)// 缺陷类别


}
function closeDefectListDialogView(){
        defectListDialogView.closePopup()
}

function openMaxImageDialogView(currenctmaxImageSource,currentImageObjects){
    maxImageDialogView.myPopup(currenctmaxImageSource,currentImageObjects)

}

function closeMaxImageDialogView(){
    maxImageDialogView.close()
}

}
