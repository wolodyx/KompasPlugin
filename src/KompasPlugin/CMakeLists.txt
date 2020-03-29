CreateImportTlbFiles()

set(SOURCE_FILES
  ImportTlbFiles.h
  KompasPlugin.cpp
  KompasPlugin.def
  stdafx.h              	stdafx.cpp
)

add_library(KompasPlugin
  SHARED
  ${SOURCE_FILES}
)

target_link_libraries(KompasPlugin
  PRIVATE Kompas3D Utility
)

target_include_directories(KompasPlugin
  PRIVATE ${CMAKE_CURRENT_BINARY_DIR}
)

set_target_properties(KompasPlugin PROPERTIES SUFFIX ".rtw")
