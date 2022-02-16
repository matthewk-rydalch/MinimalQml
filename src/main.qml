import QtQuick 2.0
import QtQuick.Controls 1.0

Item
{
    id: ui
    width: 640
    height: 150
    ListModel
    {
        id: myModel
        ListElement
        {
            source: "N/A"
            index: 0
        }
    }

    Rectangle
    {
        visible: true
        anchors.fill: parent
        Rectangle
        {
            id: clicker
            visible: true
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: 40
            MouseArea
                {
                anchors.fill: parent
                onClicked:
                {
                    myModel.append({"source": "clicker", "index": "N/A"})
                }
            }
        }
        Rectangle
        {
            id: myTable
            visible: true
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: clicker.right
            anchors.right: parent.right
            TableView 
            {
                anchors.fill: parent
                sortIndicatorVisible: true
                sortIndicatorColumn: 1
                sortIndicatorOrder: Qt.AscendingOrder
                alternatingRowColors: true
                TableViewColumn
                {
                    role: "source"
                    title: "source"
                    width: 320
                }
                TableViewColumn
                {
                    role: "index"
                    title: "index"
                    width: 320
                }
                model: myModel
                onSortIndicatorOrderChanged:
                {
                    console.log("order changed")
                }
            }
        }
    }
    Item
    {
        Timer
        {
            interval: 1000; running: true; repeat: true
            onTriggered: 
            {
                tableView.add_field_to_table_from_cpp();
            }
        }
    }
    Connections
    {
        target: tableView
        onAddFieldInQml:
        {
            myModel.append({"source": "timer", "index": index})  
        }
        onShakeThingsUp:
        {
            myModel.remove(1)
            myModel.insert(indexPlusSome, {"source": "shake up", "index": -1})
        }
    }
}