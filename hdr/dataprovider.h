/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the iFresh application.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

#ifndef DATAPROVIDER_H
#define DATAPROVIDER_H

#include <QNetworkAccessManager>
#include <QObject>
#include "ifreshnetworkmanager.h"

class DataProvider : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int indicePM25 READ indicePM25 WRITE setIndicePM25 NOTIFY indicePM25Changed)
    Q_PROPERTY(int indicePM10 READ indicePM10 WRITE setIndicePM10 NOTIFY indicePM10Changed)
    Q_PROPERTY(int indiceO3   READ indiceO3   WRITE setIndiceO3   NOTIFY indiceO3Changed)
    Q_PROPERTY(int indiceNo2  READ indiceNo2  WRITE setIndiceNo2  NOTIFY indiceNo2Changed)
    Q_PROPERTY(int indiceSo2  READ indiceSo2  WRITE setIndiceSo2  NOTIFY indiceSo2Changed)
    Q_PROPERTY(int indiceCo   READ indiceCo   WRITE setIndiceCo   NOTIFY indiceCoChanged)
    Q_PROPERTY(QString city   READ city       WRITE setCity       NOTIFY cityChanged)

    friend class DataProviderTest;

public:
    explicit DataProvider(QObject *parent = 0);
   ~DataProvider();

    Q_INVOKABLE void getPollutionInfos(const QUrl&);

    int indicePM25() const;
    int indicePM10() const;
    int indiceO3()   const;
    int indiceNo2()  const;
    int indiceSo2()  const;
    int indiceCo()   const;
    QString city()   const;

    void setIndicePM25(int);
    void setIndicePM10(int);
    void setIndiceO3(int);
    void setIndiceNo2(int);
    void setIndiceSo2(int);
    void setIndiceCo(int);
    void setCity(const QString);

    void setNetworkManager(QNetworkAccessManager*);

signals:
    void indicePM25Changed();
    void indicePM10Changed();
    void indiceO3Changed();
    void indiceNo2Changed();
    void indiceSo2Changed();
    void indiceCoChanged();
    void cityChanged();

public slots:
    bool onResult(QNetworkReply* rep);

private:
    QNetworkAccessManager* m_networkManager;
    iFreshNetworkManager   m_networkInterface;

    int m_indicePM25;
    int m_indicePM10;
    int m_indiceO3;
    int m_indiceNo2;
    int m_indiceSo2;
    int m_indiceCo;
    QString m_city;
};

#endif // DATAPROVIDER_H
