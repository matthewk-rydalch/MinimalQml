#include <QApplication>
#include <QQuickView>

int main(int argc, char** argv)
{
    QApplication app(argc, argv);
    QQuickView view;

    view.setSource(QUrl::fromLocalFile("/home/matt/sandbox/MinimalQml/src/main.qml"));
    view.show();

    return app.exec();
}

