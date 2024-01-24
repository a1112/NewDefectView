import QtQuick 2.15

Item {
    property real titleHeadHeight: responsive.titleHeadHeight  // 标题高度
    property real titleButtonTextSize: 0.16*dpi
    property real buttonTextSize: 0.15*dpi
    property real itemTabHeight: 0.4*dpi

    property real itemListHeight: 0.3*dpi

    property real textSize: 0.2*dpi
    property real listTextSize: 0.17*dpi
    property real titleTextSize: 0.25*dpi
    property real elevation: 5

    property real levelDefectListWidth: 4*dpi
    property real levelDefectMaxImageHeight: 5.8*dpi
    property real levelDefectIOneViewHeight: 3*dpi
    property real levelFooterViewHeight: 4*dpi
    property real levelListWidth: 6.5*dpi



    property ResponsiveBase responsive: ResponsiveBase{}
}
