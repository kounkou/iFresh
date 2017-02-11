
#include "gtest/gtest.h"
#include "../dataProvider.h"

class DataProviderTest : public ::testing::Test 
{
   protected:
   virtual void SetUp() 
   {
   }

   virtual void TearDown() 
   {
      // Code here will be called immediately after each test
      // (right before the destructor).
   }
};

TEST_F(DataProviderTest, indicePM25)
{
   DataProviderTest dataProviderTest;
}

