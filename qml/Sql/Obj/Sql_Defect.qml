import QtQuick 2.15

Item {
    property int defectID
    property int defectNo
    property real defectX
    property real defectY
    property real defectWidth
    property real defectHeight
    property real defectSource
    property real boxX
    property real boxY
    property real boxW
    property real boxH
    property int cameraId
    property int imageIndex
    property int seqNo
    property int grade: 1

    property real defectCoefficient
    //            defectID:10
    //            defectX:100
    //            defectY:300
    //            defectWidth:20
    //            defectHeight:40
    //            defectSource:""

    //    "defectNo": defect.defectID,  # 单个缺陷本身的Id
    //    "defectID": defect.defectClass,  # 缺陷类别的Id
    //    "bmIndex": 1 - bmIndex,  # 上表面1 下表面0
    //    "seqNo": seqNo,
    //    "cameraId": cameraId,
    //    "imageIndex": defect.imgIndex,
    //    "defectX": rec[0],
    //    "defectY": rec[1],
    //    "defectWidth": rec[2],
    //    "defectHeight": rec[3],
    //    "rec": rec,
    //    "box": [defect.leftInImg, defect.topInImg, defect.rightInImg - defect.leftInImg,
    //            defect.bottomInImg - defect.topInImg],
    //    "boxX": defect.leftInImg,
    //    "boxY": defect.topInImg,
    //    "boxW": defect.rightInImg - defect.leftInImg,
    //    "boxH": defect.bottomInImg - defect.topInImg,
    //    "defectCoefficient": f"{defect.grade} %"
    function toDict(){
        return{
            "defectID":defectID,
            "defectX":defectX,
            "defectY":defectY,
            "defectWidth":defectWidth,
            "defectHeight":defectHeight,
            "defectSource":defectSource,
            "boxX":boxX,
            "boxY":boxY,
            "boxW":boxW,
            "boxH":boxH,
            "cameraId":cameraId,
            "imageIndex":imageIndex,
            "seqNo":seqNo,
            "defectNo":defectNo,
            "grade":grade
        }
    }


    function init_sql(defect){
        defectID=defect.defectID
        defectX=defect.defectX
        defectY=defect.defectY
        defectWidth=defect.defectWidth
        defectHeight=defect.defectHeight
        boxX=defect.boxX
        boxY=defect.boxY
        boxW=defect.boxW
        boxH=defect.boxH
        cameraId=defect.cameraId
        imageIndex=defect.imageIndex
        seqNo=defect.seqNo
        defectNo=defect.defectNo
        grade=defect.grade
    }
}
