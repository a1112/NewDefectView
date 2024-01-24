import QtQuick 2.15
import QtCharts 2.15
ChartView {
    backgroundColor: "#11FFFFFF"
    plotArea:Qt.rect(0,0,width,height)
    animationOptions:ChartView.AllAnimations
    backgroundRoundness:0
    legend.visible: false
    antialiasing: true
    margins{
    left:0
    right: 0
    bottom:0
    top:0}
}
