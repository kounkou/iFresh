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
{
    m_networkManager = new QNetworkAccessManager();

    /*
     * update infos when booting for
     * the first time
     */
    getPollutionInfos();

    QObject::connect(m_networkManager, SIGNAL(finished(QNetworkReply*)), this, SLOT(onResult(QNetworkReply*)));
}

DataProvider::~DataProvider()
{
    if (m_networkManager != NULL)
        delete m_networkManager;
    m_networkManager = NULL;
}

void DataProvider::getPollutionInfos()
{
    /*
     * TODO :
     * add parameters to method
     * + use it in request
     */
    qDebug() << "sending request";

    QUrl url("http://api.waqi.info/feed/Paris/?token=72c65a4d8065ed2f14fb5597aa643c5643ab4b07");
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
void DataProvider::onResult(QNetworkReply* rep)
{
    qDebug() << "received response";

    if (rep->error() != QNetworkReply::NoError)
    {
        qDebug() << "Error when reading the data";
        return;
    }

    QString data = (QString)rep->readAll();
    qDebug() << data;
    QJsonDocument doc = QJsonDocument::fromJson(data.toUtf8());

    if (doc.isNull())
    {
        qDebug() << "Invalid json document";
        return;
    }
    else if (doc.isObject())
    {
        QJsonObject jsonObj = doc.object();
        qDebug() << "status : " << jsonObj.value(QString("status"));

        QVariantMap mainMap = jsonObj.toVariantMap();
        QVariantMap dataMap = mainMap["data"].toMap();

        // get the indice value of iaqi
        QVariantMap iaqiMap   = dataMap["iaqi"].toMap();

        // setting the
        setIndicePM25((iaqiMap["pm25"].toMap())["v"].toInt());
        setIndicePM10((iaqiMap["pm10"].toMap())["v"].toInt());
        setIndiceO3((iaqiMap["o3"].toMap())["v"].toInt());
        setIndiceNo2((iaqiMap["no2"].toMap())["v"].toInt());
        setIndiceSo2((iaqiMap["so2"].toMap())["v"].toInt());
        setIndiceCo((iaqiMap["co"].toMap())["v"].toInt());
    }
}

int DataProvider::indicePM25() const { return m_indicePM25; }
int DataProvider::indicePM10() const { return m_indicePM10; }
int DataProvider::indiceO3()   const { return m_indiceO3; }
int DataProvider::indiceNo2()  const { return m_indiceNo2; }
int DataProvider::indiceSo2()  const { return m_indiceSo2; }
int DataProvider::indiceCo()   const { return m_indiceCo; }

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
