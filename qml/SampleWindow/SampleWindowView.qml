import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "Sample"
import "Core"
/*
样本管理

*/
Item {
    id:root
    property real sampleWidth: (root.width-centViewLoader.width)/2
    property SampleCore sampleCore: SampleCore{}


    SplitView{
        anchors.fill: parent
        Loader{
            SplitView.preferredWidth: sampleWidth
            SplitView.fillHeight: true
            SplitView.minimumWidth: sampleWidth-100
            width: centView
            asynchronous: true
            sourceComponent:SampleViewView{
                width: centView
                sampleItemCore: sampleCore.sampleItemCore_l
            }
        }
        Loader{
            id:centViewLoader
            asynchronous: true
            SplitView.fillHeight: false
            SplitView.preferredWidth: 260
            SplitView.minimumWidth: 150
            sourceComponent:
                CenterToolView{
            }
        }
        Loader{
            asynchronous: true
            SplitView.preferredWidth: sampleWidth
            SplitView.fillHeight: true
            sourceComponent:
                SampleViewView{
                width: centView
                                sampleItemCore: sampleCore.sampleItemCore_r
            }
        }
    }




}
