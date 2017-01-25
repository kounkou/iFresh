#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtWebView>
#include <QDebug>
#include "dataprovider.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QtWebView::initialize();

    QQmlApplicationEngine engine;

    qmlRegisterType<DataProvider>("panorama.Aqicn.DataProvider", 1, 0, "DataProvider");

    qDebug() << "offlineStoragPath orig: " << engine.offlineStoragePath();
    engine.load(QUrl(QLatin1String("qrc:/main.qml")));

    return app.exec();
}
