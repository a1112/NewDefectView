import QtQuick 2.14
import QtQuick.Layouts 1.14
import QtQuick.Controls 2.14
import QtQuick.Controls.Material 2.14
Row{

    property int textAlign: Text.AlignLeft
    onTextAlignChanged: {
        switch(textAlign){
        case Text.AlignLeft:
            left_tool.checked=true
            center_tool.checked=false
            right_tool.checked=false
            break
        case Text.AlignHCenter:
            left_tool.checked=false
            center_tool.checked=true
            right_tool.checked=false
            break
        case Text.AlignRight:
            left_tool.checked=false
            center_tool.checked=false
            right_tool.checked=true
            break
        default:break
        }
    }
    ImageToolItem{
        id:left_tool
        source: "qrc:/resoure/icon/arrow.png"
        border_color: "#3F51B5"
        onCheckedChanged:if(checked)textAlign=Text.AlignLeft
    }
    ImageToolItem{
        id:center_tool
        source: "qrc:/resoure/icon/move.png"
        border_color:"#FF5722"
        onCheckedChanged:if(checked)textAlign=Text.AlignHCenter
    }
    ImageToolItem{
        id:right_tool
        source: "qrc:/resoure/icon/help.png"
        border_color: "#4CAF50"
        onCheckedChanged:if(checked)textAlign=Text.AlignRight
    }
}


