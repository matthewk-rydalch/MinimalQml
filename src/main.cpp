#include <QApplication>
#include <QQuickView>

int main(int argc, char** argv)
{
    QApplication app(argc, argv);
    QQuickView view;

    view.setSource(QUrl::fromLocalFile("/home/matt/Projects/sandbox/qml_sandbox/src/main.qml"));

    return app.exec();
}