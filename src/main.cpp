#include <QApplication>
#include <QQuickView>
#include <QQmlContext>
#include "tableView.h"

int main(int argc, char** argv)
{
    QApplication app(argc, argv);
    QQuickView view;

    // TableView* tableView;
    // tableView = new TableView;
    TableView tableView;

    view.rootContext()->setContextProperty("tableView", &tableView);
    view.setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view.show();

    return app.exec();
}