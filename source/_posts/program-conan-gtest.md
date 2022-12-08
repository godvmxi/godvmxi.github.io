---
title: conan gtest demo
date: 2022-12-08 16:40:12
tags:
    - cxx
    - conan
    - gtest
---
# related error


- undefined reference to `testing::internal::FormatFileLocation[abi:cxx11](char const*, int)'
- undefined reference to `testing::internal::FormatFileLocation[abi:cxx11](char const*, int)'
- undefined reference to `testing::internal::\*\*Log\*\*


# workaround

The problem is that conan does download/compile gtest binaries by default with libstdc++ even if my compiler (gcc 6.3) uses libstdc++11 by default. Thus there is a mismatch between libstdc++ and libstdc++11.

To workaround this issue you have to explicit tell conan to compile with libstdc++11:

```c
conan install .. --build missing -s compiler=gcc -s compiler.version=6.3 -s compiler.libcxx=libstdc++11
```

[**Reference page**](https://www.appsloveworld.com/cplus/100/127/gtest-installed-with-conan-undefined-reference)



# demo project

##  conanfile.txt
```c
[requires]
gtest/1.10.0

[generators]
cmake

```

## CMakeLists.txt
```c
cmake_minimum_required(VERSION 3.12)
project(gmock CXX) 
#set(CMAKE_CXX_FLAGS "-std=c++11 -g -O0")
SET(CMAKE_CXX_STANDARD 11)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()


set(target mock01)
message(STATUS "CXX FLAGS: ${CMAKE_CXX_FLAGS}")
message("-- Conan libs: ${CONAN_LIBS}")

add_executable (${target} ${target}.cpp)

target_link_libraries (${target} 
            ${CONAN_LIBS}
            )

```

## mock01.cpp
ignore the test shit
```c

#include <gmock/gmock.h>
#include <gtest/gtest.h>
#include <iostream>
using ::testing::AtLeast;
using ::testing::NiceMock;
using ::testing::StrictMock;
using ::testing::Return;

class Turtle {
public:
    Turtle() {};
    virtual ~Turtle() {}
    virtual void PenUp() = 0;
    virtual void PenDown() = 0;
    virtual int  Count() = 0;
    #if 0
    virtual void Forward(int distance) = 0;
    virtual void Turn(int degrees) = 0;
    virtual void GoTo(int x, int y) = 0;
    virtual int GetX() const = 0;
    virtual int GetY() const = 0;
    #endif
};


class MockTurtle : public Turtle {
public:
    MockTurtle() {};
    ~MockTurtle() {};
    MOCK_METHOD(void, PenUp, (), (override));
    
    MOCK_METHOD(void, PenDown, (), (override));
    MOCK_METHOD(int, Count, (), (override));
    #if 0
    MOCK_METHOD(void, Forward, (int distance), (override));
    MOCK_METHOD(void, Turn, (int degrees), (override));
    MOCK_METHOD(void, GoTo, (int x, int y), (override));
    MOCK_METHOD(int, GetX, (), (const, override));
    MOCK_METHOD(int, GetY, (), (const, override));
    #endif
};

TEST(PainterTest, CanDrawSomething) {
    #if 0
    MockTurtle turtle;    
    EXPECT_CALL(turtle, PenDown)  
        .Times(AtLeast(2));
    #else
    NiceMock<MockTurtle> turtle;
    //StrictMock<MockTurtle> turtle;
    //MockTurtle turtle;
    #endif
  //Painter painter(&turtle);
    ON_CALL(turtle, Count()).WillByDefault(Return(1));
    turtle.PenDown(); 
    turtle.PenDown();
    std::cout << "Count: " << turtle.Count() << std::endl;
  //EXPECT_TRUE(turtle.PenDown()); 
}

int main(int argc, char **argv)
{
    ::testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}
```