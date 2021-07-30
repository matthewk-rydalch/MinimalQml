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
        rows: 2; columns: 3; spacing: 3

        Cell { cellColor: "red"; onClicked: { helloText.color = cellColor; adder.add_to_sum(1) } }
        Cell { cellColor: "green"; onClicked: { helloText.color = cellColor; adder.add_to_sum(2) } }
        Cell { cellColor: "blue"; onClicked: { helloText.color = cellColor; adder.add_to_sum(3) } }
        // The last three cells are used to read and write to the overflow value
        Cell { cellColor: "black"; onClicked: { helloText.color = cellColor; console.log("overflowValue = ", adder.overflowValue) } } //read overflowValue
        Cell { cellColor: "black"; onClicked: { helloText.color = cellColor; adder.overflowValue = adder.overflowValue + 1 } } //add 1 to overflowValue
        Cell { cellColor: "black"; onClicked: { helloText.color = cellColor; adder.overflowValue = adder.overflowValue - 1 } } //subtract 1 to overflowValue
    }
    Connections {
        target: adder
        onOverflow: console.log("overflow")
    }
    Connections {
        target: adder
        onOverflowValueChanged: console.log("overflow value changed", adder.overflowValue)
    }
}