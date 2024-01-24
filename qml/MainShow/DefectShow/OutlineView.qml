import QtQuick 2.15
import QtCharts 2.15
import "../../charts"
ChartViewBase {
    plotArea:Qt.rect(0,0,width,height)
    ValueAxis{  // 可优化
        visible:false
        id:id_axisY
        min:0
        max:1
        gridLineColor:"#00000000"
    }
    ValueAxis{
        visible:false
        id:id_axisX
        min:0
        max:defectShowViewroot.steelDrawWidth
        gridLineColor:"#00000000"
    }
    LineSeries{
        id:outLineSeriesUp
        useOpenGL:true
        axisX: id_axisX
        axisY: id_axisY
    }
    LineSeries{
        id:outLineSeriesDown
        useOpenGL:true
        axisX: id_axisX
        axisY: id_axisY
    }
    Component.onCompleted: {
        defectShowViewroot.outLineSeriesUp=outLineSeriesUp
        defectShowViewroot.outLineSeriesDown=outLineSeriesDown
    }
}
