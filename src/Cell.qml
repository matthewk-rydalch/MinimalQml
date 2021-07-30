import QtQuick 2.0

Item { //This is a component.  It is accessible to other files in the same directory or its directory can be imported if not in the same directory.
    id: container
    property alias cellColor: rectangle.color // Alias just changes the name of a property
    signal clicked() //Signals are like functions.  They need a type and a variable name.  In this case it can be empty.  Tutorial 2 doesn't work.

    width: 40; height: 25

    Rectangle {
        id: rectangle
        border.color: "white"
        anchors.fill: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: container.clicked()
    }

    function fibonacci(n){
        var arr = [0, 1];
        for (var i = 2; i < n + 1; i++)
            arr.push(arr[i - 2] + arr[i -1]);

        console.log(arr);
    }
}