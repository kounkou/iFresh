#ifndef IFRESHNETWORKMANAGER_H
#define IFRESHNETWORKMANAGER_H

#include "inetworkprovider.h"

class iFreshNetworkManager : public INetworkProvider
{
public:
    iFreshNetworkManager();
   ~iFreshNetworkManager();

    QNetworkAccessManager* getNetworkManager();
};

#endif // IFRESHNETWORKMANAGER_H
