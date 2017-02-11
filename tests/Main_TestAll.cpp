/*
 * Setting in place Google Tests
 * This is the Initial version
 * of a set of files to be used to
 * test iFresh application
 */

#include <gtest/gtest.h>

int main(int argc, char *argv[])
{
   ::testing::InitGoogleTest(&argc, argv);

   return RUN_ALL_TESTS();
}

