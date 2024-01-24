import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
Item{
    id:root
    Layout.fillWidth: true
    Layout.fillHeight: true
    signal search(date fromDate,date toDate)
SearchViewByDate{
width: parent.width
onSearch: root.search(fromDate,toDate)
}
}
