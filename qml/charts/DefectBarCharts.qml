import QtQuick 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
ChartViewBase {
    width: 400
    height: 300
    theme: ChartView.ChartThemeBrownSand
    antialiasing: true
    PieSeries {
        id: pieSeries
        PieSlice {
            label: "eaten"
            value: 94.9
            labelVisible:true
        }
        PieSlice {
            label: "not yet eaten"
            value: 5.1
            labelVisible:true
        }
    }
}
