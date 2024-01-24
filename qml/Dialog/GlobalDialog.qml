import QtQuick 2.0
import QtQuick.Controls 2.15
import Qt.labs.platform 1.1
import QtQuick.Dialogs 1.3
Item {
    id:root
MessageDialog{
    id:msgDialog
icon:StandardIcon.Critical
modality :Qt.ApplicationModal
}
Timer{
}
function openMsgFialog(text){
msgDialog.icon=StandardIcon.Critical
    msgDialog.text=text
    msgDialog.open()
}
function openErrorMsgDialog(text){
    msgDialog.icon=StandardIcon.Critical
    msgDialog.text=text
    msgDialog.open()
}
function closeMsgFialog(){
    msgDialog.close()
}
ColorDialog{
    id:colorDialog
    onAccepted: coloracceptFunc(color)
}
property var coloracceptFunc
function openColorDialog(acceptFunc){
    coloracceptFunc=acceptFunc
    colorDialog.open()
}
}
