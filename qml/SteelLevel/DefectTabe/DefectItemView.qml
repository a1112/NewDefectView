import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Frame{

    function listToString(list_){
        return ""+list_// list_[0]  +list_[1]+list_[2]+list_[3]
    }

       width: parent.width
       height: col.height
       id: frame
Column {
   width: parent.width
    id:col
      LabelItem{
        text:"id: "+id+ "  缺陷名称：" +name.replace("\n"," ",10)
      font.bold: true
      }
   LabelItem{
     text: "缺陷描述：" +msg
     width: frame.width
    wrapMode: Text.WrapAnywhere
   }

   LabelItem{
     text: "L (一级缺陷):" + levelNsg_L
     width: frame.width
    wrapMode: Text.WrapAnywhere
   }

   LabelItem{
     text: "M (二级缺陷):" + levelNsg_M
     width: frame.width
    wrapMode: Text.WrapAnywhere
   }

   LabelItem{
     text: "S (三级缺陷):" + levelNsg_S
     width: frame.width
    wrapMode: Text.WrapAnywhere
   }

Item{
height: 20
width: 1
}
}
}
