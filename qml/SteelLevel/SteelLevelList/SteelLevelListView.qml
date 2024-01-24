import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../COM/FluentUI/Controls"


Item{
    id:root
    property var dataSource : []
    Component.onCompleted: {
        loaTitles()
    }
    FluTableView{
        id:table_view
        anchors.fill: parent
        anchors.topMargin: 0
        columnSource:[
            {
                "title": 'Id',
                "dataIndex": 'steelID',
                "readOnly":true,
            },
            {
                "title": '钢板号',
                "dataIndex": 'steelNo',
                "width":100,
                "minimumWidth":80,
                "maximumWidth":130,
                "readOnly":true,

            },
            {
                "title": '母版号',
                "dataIndex": 'coilID',
                "width":100,
                "minimumWidth":80,
                "maximumWidth":160,
                "readOnly":true,
            },
            {
                "title": '钢种',
                "dataIndex": 'steelType',
                "width":100,
                "minimumWidth":80,
                "maximumWidth":160,
                "readOnly":true,
            },
            {
                "title": '时间',
                "dataIndex": 'detectTime',
                "width":200,
                "minimumWidth":150,
                "maximumWidth":250,
                "readOnly":true,
            },
            {
                "title": '级别',
                "dataIndex": 'level',
                "width":200,
                "minimumWidth":150,
                "maximumWidth":250,
                "readOnly":true,
            }
        ]
    }

    FluPagination{
        id:gagination
        anchors{
            bottom: parent.bottom
            left: parent.left
        }
        pageCurrent: 1
        itemCount: 100000
        pageButtonCount: 7
        __itemPerPage: 500
        onRequestPage:
            (page,count)=> {
                table_view.closeEditor()
                loadData(page,count)
                table_view.resetPosition()
            }
    }

    function loaTitles(){
        table_view.columnSource = [
                    {
                        "title": 'Id',
                        "dataIndex": 'steelID',
                        "readOnly":true,
                        "width":60,
                        "minimumWidth":50,
                        "maximumWidth":100,
                        "readOnly":true,
                    },
                    {
                        "title": '钢板号',
                        "dataIndex": 'steelNo',
                        "width":220,
                        "minimumWidth":80,
                        "maximumWidth":300,
                        "readOnly":true,

                    },
                    {
                        "title": '母版号',
                        "dataIndex": 'coilID',
                        "width":100,
                        "minimumWidth":80,
                        "maximumWidth":160,
                        "readOnly":true,
                    },
                    {
                        "title": '钢种',
                        "dataIndex": 'steelType',
                        "width":100,
                        "minimumWidth":80,
                        "maximumWidth":160,
                        "readOnly":true,
                    },
                    {
                        "title": '时间',
                        "dataIndex": 'detectTime',
                        "width":200,
                        "minimumWidth":150,
                        "maximumWidth":250,
                        "readOnly":true,
                    },
                    {
                        "title": '级别',
                        "dataIndex": 'level',
                        "width":60,
                        "minimumWidth":50,
                        "maximumWidth":100,
                        "readOnly":true,
                    }
                ]
    }

    property ListModel core_moel: coreModels.mainListModel
    property int curListViewType: coreModels.listViewType
    onCurListViewTypeChanged: {
        loadData(1,1000)
    }
    Connections{
        target: core_moel
        function onCountChanged(){
            loadData(1,1000)
        }
    }
    function loadData(page,count){
        const dataSource = []
        for (let index=0;index<core_moel.count;index++)
        {
            let item=core_moel.get(index)
            dataSource.push({
                                steelID: item.steelID,
                                steelNo: item.steelNo,
                                coilID: item.coilID,
                                steelType: item.steelType,
                                detectTime: item.detectTime,
                                level: " ",
                                minimumHeight:30
                            })
        }

        root.dataSource = dataSource
        table_view.dataSource = root.dataSource
    }
}

