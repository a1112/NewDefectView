/* 外 阴影 基础类 方便统一阴影样式
*/
import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.13
import QtGraphicalEffects 1.14

DropShadow{
    enabled: shadowConfig.enabled
        horizontalOffset: shadowConfig.horizontalOffset
        verticalOffset: shadowConfig.verticalOffset
        radius:shadowConfig.radius
        samples: shadowConfig.samples
        color: !enabled?"#00000000":shadowConfig.color
    }
