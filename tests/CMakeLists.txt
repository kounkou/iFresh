# CMakeLists.txt
cmake_minimum_required(VERSION 2.6)

# Locate GTest
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})

# generate the test binary in bin
set(EXECUTABLE_OUTPUT_PATH bin)

# Link runTests with what we want to test and the GTest and pthread library
add_executable(runTests Main_TestAll.cpp
                        DataProvider_Test.cpp)
target_link_libraries(runTests ${GTEST_LIBRARIES} pthread)
