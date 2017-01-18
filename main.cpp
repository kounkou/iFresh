/*
 * $QT_BEGIN_LICENSE:LGPL3-COMM$
 *
 * Copyright (C) 2016 Godfrain Jacques Kounkou.
 * Permission is granted to copy, distribute and/or modify this document
 * under the terms of the GNU Free Documentation License, Version 1.3
 * or any later version published by the Free Software Foundation;
 * with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
 * A copy of the license is included in the section entitled "GNU
 * Free Documentation License".
 *
 * $QT_END_LICENSE
 *
 * This is the main file
 */

#include <QApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    try
    {
        QQmlApplicationEngine engine;
        engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    }

    /*
     * when this happens, we need to
     * report the issue on the dedicated
     * issue server.
     */
    catch (std::exception& e)
    {
        qDebug() << "Exception : " << e.what();
    }
    catch (...)
    {
        qDebug() << "Unknown exception when launching swap";
    }

    return app.exec();
}
