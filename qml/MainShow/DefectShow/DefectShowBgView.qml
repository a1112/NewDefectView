import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
Item {
    id:root
    Layout.fillWidth: true
    Layout.fillHeight: true
    property int xLineCount: 10
    property int yLineCount: 6
    Rectangle{
    anchors.fill: parent
    color:coreStyle.theme===Material.Dark?"#282828":"#686868"
    border.width: 1
    border.color: Material.color(Material.Yellow)
    }
    Canvas{
        id:lineCanvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")
            ctx.strokeStyle = '#004646'
            ctx.beginPath()
            ctx.setLineDash([4, 8])
            let i=0
            for (i=0;i<xLineCount;i++){
                let fromX = (i+1)*(root.width/xLineCount)
                let toX=fromX
                let fromY = 0
                let toY=height
                 ctx.moveTo(fromX,fromY)
                ctx.lineTo(toX,toY)
//                ctx.stroke();
            }
       for (i=0;i<yLineCount;i++){
           if (i==2)
               continue
           let fromX = 0
           let toX=width
           let fromY = (i+1)*(root.height/yLineCount)
           let toY=fromY
            ctx.moveTo(fromX,fromY)
           ctx.lineTo(toX,toY)
//           ctx.stroke();
       }
       ctx.stroke();
       ctx.beginPath()
       ctx.strokeStyle = '#FFFFFF'
       ctx.setLineDash([15, 15])
       let fromX = 0
       let toX=width
       let fromY = (3)*(root.height/yLineCount)
       let toY=fromY
       ctx.moveTo(fromX,fromY)
      ctx.lineTo(toX,toY)
        ctx.stroke();
             }
    }
}
