//!!!!!! Click the red box to execute the fibonnaci function !!!!!

import QtQuick 2.0
//imports standard QML Elements

Rectangle { //This is an object of type Rectangle.
    id: page //The object is given an id page
    width: 320; height: 480 //Properties are set by property: value // they can be inline with a ;
    color: "lightgray"

    Text {
        id: helloText
        text: "Hello world!"
        y: 30
        anchors.horizontalCenter: page.horizontalCenter
        font.pointSize: 24; font.bold: true
        }

    Grid {
        id: colorPicker
        x: 4; anchors.bottom: page.bottom; anchors.bottomMargin: 4
        rows: 1; columns: 1; spacing: 3

        Cell { cellColor: "red"; onClicked: fibonacci(3) }
    }
}