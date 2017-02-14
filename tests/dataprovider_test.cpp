#include "src/dataprovider.cpp"
#include <gtest/gtest.h>
#include <memory>

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


TEST_F(DataProvider_Test, indicePM25)
{
    EXPECT_EQ(0, dataProvider->indicePM25());
}

TEST_F(DataProvider_Test, canSetIndicePM25)
{
    dataProvider->setIndicePM25(25);
    EXPECT_EQ(25, dataProvider->indicePM25());
}

