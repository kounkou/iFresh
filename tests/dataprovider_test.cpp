#include "src/dataprovider.cpp"
#include <gtest/gtest.h>

class DataProvider_Test : public ::testing::Test
{
protected:
   virtual void SetUp() {}
   virtual void TearDown() {}
};

TEST(DataProvider_Test, indicePM25)
{
   DataProvider dataProvider;

   ASSERT_EQ(0, dataProvider.indicePM25());
}
