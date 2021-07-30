import QtQuick 2.0

//model, view, and delegate to display a group of data

Rectangle {
     width: 200; height: 200

    ListModel { //Model: contains the data and its structure.  Several QML types for creating models.
        id: fruitModel
        property string language: "en"
        ListElement {
            name: "Apple"
            cost: 2.45
        }
        ListElement {
            name: "Orange"
            cost: 3.25
        }
        ListElement {
            name: "Banana"
            cost: 1.95
        }
    }

    Component { //Delegate: dictates how the data should appear in the view.
        id: fruitDelegate
        Row {
                id: fruit
                Text { text: " Fruit: " + name; color: fruit.ListView.view.fruit_color }
                Text { text: " Cost: $" + cost }
                Text { text: " Language: " + fruit.ListView.view.model.language }
        }
    }

    ListView { //View: A container that displays the data.  The view might be a list or a grid
        property color fruit_color: "green"
        model: fruitModel
        delegate: fruitDelegate
        anchors.fill: parent
    }
}