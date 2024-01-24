import QtQuick 2.15
/*
    图像分析控制台 core
*/
Item {
    /*
        当前的图像显示的索引
    */
    property int currentImageindex: 0
    property int cameraCount: 3 // 相机数量
    property int hoverdListIndex: 0  // 当前停留值
    property int imageShowModel: allImageModel
    property int allImageModel: 0
    property int maxImageModel: 1
    property int isMaxImageModel: imageShowModel===maxImageModel
    function changeModel(){
        imageShowModel=allImageModel==imageShowModel?maxImageModel:allImageModel
    }

//    {"steelLeft":[-1136,-1142,-1147,-1138,-1142,-1132,-1123,-1127,-1133,-1135,-1122,-1122,-1121,-1141,-1125],
//    "steelRight":[-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47,-47],
//    "imageIndex":[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14]}
    function get_m_x(imageIndex,cameraIndex,pix_x){
        let itrmzDataL = widthData[0]
        let itrmzDataR = widthData[widthData.length-1]
        let m_per_pix = itrmzDataR["steelRight"]-itrmzDataR["steelLeft"]


    }
    function get_m_y(imageIndex,cameraIndex,pix_y){
        return pix_ypix_y
        widthData
    }
    property real brightness: 0
    property real contrast: 0
}
