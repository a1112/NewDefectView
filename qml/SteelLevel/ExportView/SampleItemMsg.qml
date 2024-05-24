import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
SampleItemBase {
    property alias running: time.running
    property var steelInfoData
    Timer{
        id:time
        interval: 2000
        repeat: true
        running: true
        onTriggered: {
            api.getSteelLevelInfo((result)=>{
                                      let reData = JSON.parse(result)
                                        console.log(reData)
                                      steelInfoData = reData
                                  },
                                  (errorMsg)=>{
                                      console.log(errorMsg)
                                      //        globalDialog.openErrorMsgDialog("列表初始化请求失败！  "+errorMsg)
                                  })
        }
    }
    function itemToTimeString(item){
        return item["year"]+"-"+item["month"]+"-"+item["day"]+" "+item["hour"]+":"+item["minute"]
    }
    function itemToString(item){
        return "seqNo: "+item["seqNo"]+" "+itemToTimeString(item["detectTime"])
    }
    spacing: 10
    LabelBase{
        font.pointSize: 12
        text: "起始数据： " + itemToString(steelInfoData["min"])
    }
    LabelBase{
        font.pointSize: 12
        text: " 末尾数据： " + itemToString(steelInfoData["max"])
    }
    // LabelBase{
    //     font.pointSize: 12
    //     text: " 剩余 "
    // }
}
