#include "ifreshnetworkmanager.h"

iFreshNetworkManager::iFreshNetworkManager()
{
}

iFreshNetworkManager::~iFreshNetworkManager()
{
}

QNetworkAccessManager* iFreshNetworkManager::getNetworkManager()
{
    return new QNetworkAccessManager();
}
