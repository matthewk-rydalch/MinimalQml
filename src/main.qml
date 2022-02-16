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
            column1: "value 1"
            column2: "value 2"
        }
        ListElement
        {
            column1: "value 3"
            column2: "value 4"
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
                    console.log("clicked")
                    myModel.append({"column1": "blah", "column2": "duh"})
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
                    role: "column1"
                    title: "odds"
                    width: 320
                }
                TableViewColumn
                {
                    role: "column2"
                    title: "evens"
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
}