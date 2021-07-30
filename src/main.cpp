#include <QApplication>
#include <QQuickView>
#include <QQmlContext>
#include <iostream>

#include "sequence.h"

int main(int argc, char** argv)
{
    QApplication app(argc, argv);
    QQuickView view;

    Sequence sequence;
    std::cout << "check: " << sequence.check << std::endl;
    view.rootContext()->setContextProperty("seq", &sequence); // the object will be available in QML with name "sequence"

    view.setSource(QUrl::fromLocalFile("/home/matt/sandbox/qml_sandbox/src/main.qml"));
    view.show();

    return app.exec();
}

