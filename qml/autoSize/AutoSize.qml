import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15

Item {

    property int desktopAvailableWidth: Screen.desktopAvailableWidth
    property int desktopAvailableHeight: Screen.desktopAvailableHeight
    property real screenWidth: desktopAvailableWidth/Screen.pixelDensity/25.4
    property real screenHeight: desktopAvailableHeight/Screen.pixelDensity/25.4
    property real screenSize: Math.sqrt(screenWidth**2+screenHeight**2)

    function getDpi(){

        return Screen.pixelDensity*25.4*appScale

    }

    property real dpi: Screen.pixelDensity*25.4*appScale

    property real appScale: {
        console.log("screenSize",screenSize)
        if (screenSize>80)
            return 1.5
        return screenSize>20?1:screenSize>16?0.8:0.7
    }
    property real titleHeadHeight: 0.5*dpi  // 标题高度
    property real titleButtonTextSize: 0.16*dpi
    property real buttonTextSize: 0.15*dpi
    property real itemTabHeight: 0.4*dpi

    property real itemListHeight: 0.3*dpi

    property real textSize: 0.15*dpi
    property real listTextSize: 0.17*dpi
    property real titleTextSize: 0.25*dpi
    property real elevation: 5

    property real levelDefectListWidth: 3*dpi
    property real levelDefectMaxImageHeight: 5.8*dpi
    property real levelDefectIOneViewHeight: 3*dpi
    property real levelFooterViewHeight: 4*dpi
    property real levelListWidth: 6.5*dpi

    property ResponsiveBase responsive: ResponsiveBase{}
}
