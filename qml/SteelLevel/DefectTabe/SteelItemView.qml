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
      text:"id: "+id+ " 缺陷名称：" +name.replace("\n"," ",10)
      font.bold: true
      }

   LabelItem{
     text: "缺陷描述："
     width: frame.width
    wrapMode: Text.WrapAnywhere
   }

   LabelItem{
     text: "等级需求:" + levelNsg_Level
     width: frame.width
    wrapMode: Text.WrapAnywhere
   }

   LabelItem{
     text: "头部需求:" + levelNsg_T
     width: frame.width
    wrapMode: Text.WrapAnywhere
   }

   LabelItem{
     text: "边部需求:" + levelNsg_B
     width: frame.width
    wrapMode: Text.WrapAnywhere
   }

Item{
height: 20
width: 1
}
}
}
