#include "src/dataprovider.cpp"
#include <gtest/gtest.h>
#include <memory>
#include "inetworkprovider.h"

/*
 * Let's create a Test Fixture as
 * we need to have the object 'dataProvider'
 * accessible is all the cases
 * dedicated to particulates
 */
class DataProvider_Test : public ::testing::Test
{
public:
    std::unique_ptr<DataProvider> dataProvider;

    DataProvider_Test()
    {
        dataProvider = std::unique_ptr<DataProvider>(new DataProvider);
    }

   ~DataProvider_Test()
    {
        // nothing here as we use smart pointers
    }

protected:
   virtual void SetUp()    {}
   virtual void TearDown() {}
};

TEST_F(DataProvider_Test, indicePM25) { EXPECT_EQ(0,  dataProvider->indicePM25()); }
TEST_F(DataProvider_Test, indicePM10) { EXPECT_EQ(0,  dataProvider->indicePM10()); }
TEST_F(DataProvider_Test, indiceO3)   { EXPECT_EQ(0,  dataProvider->indiceO3());   }
TEST_F(DataProvider_Test, indiceNo2)  { EXPECT_EQ(0,  dataProvider->indiceNo2());  }
TEST_F(DataProvider_Test, indiceSo2)  { EXPECT_EQ(0,  dataProvider->indiceSo2());  }
TEST_F(DataProvider_Test, indiceCo)   { EXPECT_EQ(0,  dataProvider->indiceCo());   }
TEST_F(DataProvider_Test, city)       { EXPECT_EQ("Paris", dataProvider->city());  }

TEST_F(DataProvider_Test, canSetIndicePM25) { dataProvider->setIndicePM25(25); EXPECT_EQ(25, dataProvider->indicePM25()); }
TEST_F(DataProvider_Test, canSetIndicePM10) { dataProvider->setIndicePM10(25); EXPECT_EQ(25, dataProvider->indicePM10()); }
TEST_F(DataProvider_Test, canSetIndiceO3)   { dataProvider->setIndiceO3(25);   EXPECT_EQ(25, dataProvider->indiceO3());   }
TEST_F(DataProvider_Test, canSetIndiceNo2)  { dataProvider->setIndiceNo2(25);  EXPECT_EQ(25, dataProvider->indiceNo2());  }
TEST_F(DataProvider_Test, canSetIndiceSo2)  { dataProvider->setIndiceSo2(25);  EXPECT_EQ(25, dataProvider->indiceSo2());  }
TEST_F(DataProvider_Test, canSetIndiceCo)   { dataProvider->setIndiceCo(25);   EXPECT_EQ(25, dataProvider->indiceCo());   }
TEST_F(DataProvider_Test, canSetCity)       { dataProvider->setCity("");       EXPECT_EQ("", dataProvider->city());       }
