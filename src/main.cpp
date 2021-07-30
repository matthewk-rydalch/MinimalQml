#include <QApplication>
#include <QQuickView>
#include <QQmlContext>
#include <iostream>

#include "adder.h"

int main(int argc, char** argv)
{
    QApplication app(argc, argv);
    QQuickView view;

    Adder adderObject;
    view.rootContext()->setContextProperty("adder", &adderObject); // the object will be available in QML with name "adder"

    view.setSource(QUrl::fromLocalFile("/home/matt/sandbox/qml_sandbox/src/main.qml"));
    view.show();

    return app.exec();
}

