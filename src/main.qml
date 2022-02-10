import QtQuick 2.0
import QtQuick.Controls 1.0

Item
{
    id: ui
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
        width: 640
        height: 480
        TableView 
        {
            anchors.fill: parent
            TableViewColumn
            {
                role: "column1"
                title: "odds"
                width: 100
            }
            TableViewColumn
            {
                role: "column2"
                title: "evens"
                width: 100
            }
            model: myModel
        }
    }
}