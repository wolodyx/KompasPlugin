set(SOURCE_FILES
  include/Utility.h             Utility.cpp
)

add_library(Utility
  STATIC
  ${SOURCE_FILES}
)

target_link_libraries(Utility
  PRIVATE Kompas3D
)

target_include_directories(Utility
  PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include
)
