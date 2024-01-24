import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
/*
显示 x,y,w,h
*/
RowLayout
{
    property var target
    Label{
        font.pixelSize:  dpi*0.2
        font.bold: true
        text: "x: "+target.x+"  y: "+target.y+"  w: "+target.width+  "  h: "+target.height
    }
}
