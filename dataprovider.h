#ifndef DATAPROVIDER_H
#define DATAPROVIDER_H

#include <QNetworkAccessManager>
#include <QObject>

class DataProvider : public QObject
{
    Q_OBJECT

    Q_PROPERTY(int indicePM25 READ indicePM25 WRITE setIndicePM25 NOTIFY indicePM25Changed)
    Q_PROPERTY(int indicePM10 READ indicePM10 WRITE setIndicePM10 NOTIFY indicePM10Changed)
    Q_PROPERTY(int indiceO3   READ indiceO3   WRITE setIndiceO3   NOTIFY indiceO3Changed)
    Q_PROPERTY(int indiceNo2  READ indiceNo2  WRITE setIndiceNo2  NOTIFY indiceNo2Changed)
    Q_PROPERTY(int indiceSo2  READ indiceSo2  WRITE setIndiceSo2  NOTIFY indiceSo2Changed)
    Q_PROPERTY(int indiceCo   READ indiceCo   WRITE setIndiceCo   NOTIFY indiceCoChanged)

public:
    explicit DataProvider(QObject *parent = 0);
   ~DataProvider();

    Q_INVOKABLE void getPollutionInfos();

    int indicePM25() const;
    int indicePM10() const;
    int indiceO3() const;
    int indiceNo2() const;
    int indiceSo2() const;
    int indiceCo() const;

    void setIndicePM25(int);
    void setIndicePM10(int);
    void setIndiceO3(int);
    void setIndiceNo2(int);
    void setIndiceSo2(int);
    void setIndiceCo(int);

signals:
    void indicePM25Changed();
    void indicePM10Changed();
    void indiceO3Changed();
    void indiceNo2Changed();
    void indiceSo2Changed();
    void indiceCoChanged();

public slots:
    void onResult(QNetworkReply* rep);

private:
    QNetworkAccessManager* m_networkManager;

    int m_indicePM25;
    int m_indicePM10;
    int m_indiceO3;
    int m_indiceNo2;
    int m_indiceSo2;
    int m_indiceCo;
};

#endif // DATAPROVIDER_H
