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

        MouseArea { 
            id: mouseArea
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            anchors.fill: parent
            onPressed: { //Some signal handlers have optional parameters as in here.
                if (mouse.button == Qt.RightButton)
                    console.log("Right mouse button pressed")
            }
        }

        onYChanged: { console.log("y has changed to:", y); seq.check = false; console.log("check: ", seq.check) }  //console.log is a print statement in qml 
        //property changed signals are emitted and can be accessed by onPropertyChanged
        // on prefaces any signal handler.

        states: State {
            name: "down"; when: mouseArea.pressed == true
            PropertyChanges { target: helloText; y: 160; rotation: 180; color: "red" }
        }

        transitions: Transition {
            from: ""; to: "down"; reversible: true //Specifies between what states the transition happens.  Also states that it is reversible (same as duplicating the opposite of this code.)
            ParallelAnimation { //Allows both animations to happen at the same time.
                NumberAnimation { properties: "y,rotation"; duration: 500; easing.type: Easing.InOutQuad }
                ColorAnimation { duration: 500 }
            }
        }
    }

    Grid {
        id: colorPicker
        x: 4; anchors.bottom: page.bottom; anchors.bottomMargin: 4
        rows: 2; columns: 3; spacing: 3

        Cell { cellColor: "red"; onClicked: { helloText.color = cellColor; seq.add_to_sum(1) } }
        Cell { cellColor: "green"; onClicked: { helloText.color = cellColor; seq.add_to_sum(2) } }
        Cell { cellColor: "blue"; onClicked: { helloText.color = cellColor; seq.add_to_sum(3) } }
        Cell { cellColor: "black"; onClicked: { helloText.color = cellColor; console.log("overflowValue = ", seq.overflowValue) } } //read overflowValue
        Cell { cellColor: "black"; onClicked: { helloText.color = cellColor; seq.overflowValue = seq.overflowValue + 1 } } //add 1 to overflowValue
        Cell { cellColor: "black"; onClicked: { helloText.color = cellColor; seq.overflowValue = seq.overflowValue - 1 } } //subtract 1 to overflowValue
    }

    Connections {
        target: seq
        onCpp_called: console.log("cpp called")
    }
    Connections {
        target: seq
        onCheckChanged: console.log("check changed")
    }
    Connections {
        target: seq
        onOverflow: console.log("overflow")
    }
}