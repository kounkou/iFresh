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

#include "dataprovider.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QJsonDocument>
#include <QJsonObject>
#include <QDebug>
#include <QJsonArray>

DataProvider::DataProvider(QObject* parent)
   : QObject(parent)
   , m_networkManager(NULL)
   , m_indicePM25(0)
   , m_indicePM10(0)
   , m_indiceO3(0)
   , m_indiceNo2(0)
   , m_indiceSo2(0)
   , m_indiceCo(0)
   , m_city("Paris")
{
    qDebug() << "In constructor";

    // dependency injection
    m_networkManager = m_networkInterface.getNetworkManager();

    QObject::connect(m_networkManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(onResult(QNetworkReply*)));
}

void DataProvider::setNetworkManager(QNetworkAccessManager* nAccessMngr)
{
    m_networkManager = nAccessMngr;
}

DataProvider::~DataProvider()
{
    if (m_networkManager != NULL)
        delete m_networkManager;
    m_networkManager = NULL;
}

/*
 * getPollutionInfos now take a url of the request
 * and perform a get
 */
void DataProvider::getPollutionInfos(const QUrl& url)
{
    qDebug() << "sending request";
    QNetworkRequest request(url);
    m_networkManager->get(request);
}

/*
 * Aqicn JSON data looks like this
 * iaqi is nested inside data
 * and iaqi contains pm25 which contains
 * each field.
 "{\
    "status\":\
    "ok\",\
    "data\":
    {\
       ...
       "iaqi\":
       {\
          "pm25\":
          {\
             "v\":101
          },\
          "pm10\":{\"v\":39},\
          "o3\"  :{\"v\":3},\
          "no2\" :{\"v\":29},\
          "so2\" :{\"v\":4},\
          "co\"  :{\"v\":12},\
          "t\"   :{\"v\":0},\
          "p\"   :{\"v\":1028},\
          "h\"   :{\"v\":80}
       }
     }
  }"
*/
bool DataProvider::onResult(QNetworkReply* rep)
{
    qDebug() << "received response";

    if (rep->error() != QNetworkReply::NoError)
    {
        qDebug() << "Error when reading the data";
        return false;
    }

    QString data = (QString)rep->readAll();
    qDebug() << data;
    QJsonDocument doc = QJsonDocument::fromJson(data.toUtf8());

    if (doc.isNull())
    {
        qDebug() << "Invalid json document";
        return false;
    }
    else if (doc.isObject())
    {
        QJsonObject jsonObj = doc.object();
        qDebug() << "status : " << jsonObj.value(QString("status"));

        if (jsonObj.value(QString("status")) != "ok")
        {
            qDebug() << "couldn't find stations";
            return false;
        }

        QVariantMap mainMap = jsonObj.toVariantMap();
        QVariantMap dataMap = mainMap["data"].toMap();

        // getting the map of iaqi
        QVariantMap iaqiMap = dataMap["iaqi"].toMap();

        // getting the values for iaqi
        setIndicePM25((iaqiMap["pm25"].toMap())["v"].toInt());
        setIndicePM10((iaqiMap["pm10"].toMap())["v"].toInt());
        setIndiceO3((iaqiMap["o3"].toMap())["v"].toInt());
        setIndiceNo2((iaqiMap["no2"].toMap())["v"].toInt());
        setIndiceSo2((iaqiMap["so2"].toMap())["v"].toInt());
        setIndiceCo((iaqiMap["co"].toMap())["v"].toInt());

        /*
         * getting the map of city +
         * getting the values for city
         */
        setCity((dataMap["city"].toMap())["name"].toString());
    }

    return true;
}

/*
 * bunch of indices getters
 * for each type of indices
 */
int     DataProvider::indicePM25() const { return m_indicePM25; }
int     DataProvider::indicePM10() const { return m_indicePM10; }
int     DataProvider::indiceO3()   const { return m_indiceO3; }
int     DataProvider::indiceNo2()  const { return m_indiceNo2; }
int     DataProvider::indiceSo2()  const { return m_indiceSo2; }
int     DataProvider::indiceCo()   const { return m_indiceCo; }
QString DataProvider::city()       const { return m_city; }

/*
 * bunch of indices setters
 * for each type of indices
 */
void DataProvider::setIndicePM25(int indicePm25)
{
    if (m_indicePM25 == indicePm25)
        return;
    m_indicePM25 = indicePm25;

    emit indicePM25Changed();
}

void DataProvider::setIndicePM10(int indicePM10)
{
    if (m_indicePM10 == indicePM10)
        return;
    m_indicePM10 = indicePM10;

    emit indicePM10Changed();
}

void DataProvider::setIndiceO3(int indiceO3)
{
    if (m_indiceO3 == indiceO3)
        return;
    m_indiceO3 = indiceO3;

    emit indiceO3Changed();
}

void DataProvider::setIndiceNo2(int indiceNo2)
{
    if (m_indiceNo2 == indiceNo2)
        return;
    m_indiceNo2 = indiceNo2;

    emit indiceNo2Changed();
}

void DataProvider::setIndiceSo2(int indiceSo2)
{
    if (m_indiceSo2 == indiceSo2)
        return;
    m_indiceSo2 = indiceSo2;

    emit indiceSo2Changed();
}

void DataProvider::setIndiceCo(int indiceCo)
{
    if (m_indiceCo == indiceCo)
        return;
    m_indiceCo = indiceCo;

    emit indiceCoChanged();
}

void DataProvider::setCity(const QString city)
{
    if (m_city == city)
        return;
    m_city = city;

    emit cityChanged();
}
