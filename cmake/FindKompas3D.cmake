add_library(Kompas3D INTERFACE IMPORTED GLOBAL)

target_link_libraries(Kompas3D
  INTERFACE
    "c:/Program Files (x86)/ASCON/KOMPAS-3D LT V12/SDK/Lib/klAPI2D5.lib"
    "c:/Program Files (x86)/ASCON/KOMPAS-3D LT V12/SDK/Lib/klAPI3D5.lib"
    "c:/Program Files (x86)/ASCON/KOMPAS-3D LT V12/SDK/Lib/klAPI5.lib"
    "c:/Program Files (x86)/ASCON/KOMPAS-3D LT V12/SDK/Lib/klAPI7.lib"
)

target_include_directories(Kompas3D
  INTERFACE
    "c:/Program Files (x86)/ASCON/KOMPAS-3D LT V12/SDK/Include"
)

target_compile_definitions(Kompas3D
  INTERFACE _AFXDLL UNICODE _UNICODE
)
