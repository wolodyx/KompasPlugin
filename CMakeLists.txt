cmake_minimum_required(VERSION 3.15 FATAL_ERROR)

project(KompasPlugin
  LANGUAGES CXX
  VERSION 0.0.1
  DESCRIPTION "My program description"
)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

include(cmake/FindKompas3D.cmake)

add_subdirectory(src)
