import QtQuick 2.15

import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import "DebugView"

import "DefectNavigationView"
import "MainShow"
import "ListShowView"

Item {
    ColumnLayout{
        spacing: 0
        anchors.fill: parent
        DefectNavigationView{
            Layout.fillWidth: true
        }
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            RowLayout{
                anchors.fill: parent
                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    MainShowView{
                    }//<-
                }
                Item{
                    Layout.fillHeight: true
                    width: 4.5*dpi
                    ListShowView{ // steel列表
                    }
                }
            }
        }

    }

}
