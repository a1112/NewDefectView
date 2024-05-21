import QtQuick 2.15
import QtQuick.Controls 2.15
import "../Base"
import "../Labels"
import QtQuick.Layouts 1.15
    /*
                        "leftInImg": defect.leftInImg,
                        "rightInImg": defect.rightInImg,
                        "topInImg": defect.topInImg,
                        "bottomInImg": defect.bottomInImg,
                        "leftInSteel": defect.leftInObj,
                        "rightInSteel": defect.rightInObj,
                        "topInSteel": defect.topInObj,
                        "bottomInSteel": defect.bottomInObj,



    */


    Column{
        id:col
        Row{
            spacing: 50
            MsgLabel{
                color:"#fff"
                text: control.getNameById(defectItemData.defectID)
        }
            MsgLabel{
                color:"#777"
                font.pointSize: 10
                text: defectItemData.defectNo
        }
        }
            MsgLabel{
                color:"#fff"
                text: "相机号: "+defectItemData.cameraId
        }
            MsgLabel{
                color:"#fff"
                text: "图像索引: "+defectItemData.imageIndex
        }
            MsgLabel{
                color:"#fff"
                text: "缺陷ID: "+defectItemData.defectID
        }

            MsgLabel{
                        color:"#fff"
                        text: "缺陷等级: "+defectItemData.grade
                }
            MsgLabel{
                    color:"#fff"
                    text: "距头: "+defectItemData.topInSteel/1000//defectItemData.topInImg +" m"
                }
            MsgLabel{
                    color:"#fff"
                    text: "距边: "+defectItemData.leftInSteel/1000
                }
            MsgLabel{
                    color:"#fff"
                    text: "置信度: "+defectItemData.defectCoefficient
            }
    }

