import QtQuick 2.15
import QtQuick.Controls 2.15
import QtCharts 2.15
ChartViewBase {
    width: 400
    height: 400
        backgroundColor: "#00FFFFFF"
    PieSeries {
        size:0.5
        id: pieSeries_id
//        PieSlice {
//            labelColor: Qt.lighter(color)
//            label: "eaten"
//            value: 94.9
//            labelVisible:true
//        }
//        PieSlice {
//            labelColor:  Qt.lighter(color)
//            label: "not yet eaten"
//            value: 5.1
//            labelVisible:true
//        }
    }
    Component.onCompleted: {
        pieSeries=pieSeries_id
    }
}
