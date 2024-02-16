import QtQuick 2.15
//自动加载 参数文件
import QtQuick.Controls 2.15
import QtQml.Models 2.15
import QtQuick.Layouts 1.15
import "Samp"
Item{
    anchors.fill: parent
    property string frame: trainWindow.trainApi.currentFrame
    onFrameChanged: {
        listModel.clear()
        console.log("getTrainConfig")

        trainApi.getTrainConfig(frame,(result)=>{
            let data = JSON.parse(result)
            console.log(result)
            for(let i=0;i<data.length;i++){
                listModel.append(data[i]
                                 )
                console.log(data[i])
            }
        },(error)=>{
            console.log(error)
        })
    }

    ListView {
        id: listView
        model: ListModel {
            id:listModel
        }
        delegate:ChooserSample{
            }
    }
}
