#ifndef INETWORKPROVIDER_H
#define INETWORKPROVIDER_H

#include <QNetworkAccessManager>

class INetworkProvider
{
public:
    virtual QNetworkAccessManager* getNetworkManager()  = 0;
    virtual ~INetworkProvider() {}
};

#endif // INETWORKPROVIDER_H
