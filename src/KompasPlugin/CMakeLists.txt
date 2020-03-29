set(SOURCE_FILES
  stdafx.h              stdafx.cpp
  KompasPlugin.cpp
  KompasPlugin.def
)

add_library(KompasPlugin
  SHARED
  ${SOURCE_FILES}
)

target_link_libraries(KompasPlugin
  PRIVATE Kompas3D Utility
)

set_target_properties(KompasPlugin PROPERTIES SUFFIX ".rtw")
